import 'package:flutter/foundation.dart';
import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:video_player/video_player.dart';

import '../cubit_base.dart';
import 'video_state.dart';

class VideoCubit extends CubitBase<VideoState> {
  VideoCubit(
    this.video, {
    this.autoPlay = true,
    this.controlsVisible = false,
  }) : super(const VideoState.initializing());

  final VideoEntity video;
  final bool autoPlay;
  final bool controlsVisible;

  bool get isLoadedState => state is VideoLoaded;
  bool get isNotLoadedState => !isLoadedState;
  VideoLoaded get loadedState => state as VideoLoaded;

  Future<void> init() async {
    final controller = VideoPlayerController.network(
      video.url,
      formatHint: VideoFormat.hls,
    );
    controller.initialize().then((_) {
      emit(VideoState.loaded(
        video: video,
        controller: controller,
        controlsVisible: controlsVisible,
        playing: autoPlay,
        volume: 0.75,
      ));
      if (autoPlay) {
        controller.play();
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      emit(const VideoState.failed());
    });
  }

  void togglePlay() {
    if (isNotLoadedState) return;
    loadedState.playing
        ? loadedState.controller.pause()
        : loadedState.controller.play();
    emit(loadedState.copyWith(
      playing: !loadedState.playing,
    ));
  }

  void toggleControlsVisibility() {
    if (isNotLoadedState) return;
    emit(loadedState.copyWith(
      controlsVisible: !loadedState.controlsVisible,
    ));
    if (loadedState.controlsNotVisible && loadedState.notPlaying) {
      togglePlay();
    }
  }

  void setVolume(
    double value,
  ) {
    if (isNotLoadedState) return;
    loadedState.controller.setVolume(value);
    emit(loadedState.copyWith(
      volume: value,
    ));
  }

  void toggleMute() {
    if (isNotLoadedState) return;
    var newState = loadedState.copyWith(
      volume: loadedState.mute ? loadedState.volumeBeforeMute : 0,
      volumeBeforeMute: loadedState.notMute
          ? loadedState.volume
          : loadedState.volumeBeforeMute,
    );
    loadedState.controller.setVolume(newState.volume);
    emit(newState);
  }
}
