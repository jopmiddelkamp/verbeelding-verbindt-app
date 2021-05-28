import 'package:verbeelding_verbindt_core/entities/common/video.dart';

import '../../bloc/cubit_base.dart';
import 'video_state.dart';

class VideoCubit extends CubitBase<VideoState> {
  VideoCubit(
    VideoEntity video,
  ) : super(VideoState.initialize(
          video: video,
        )) {
    state.controller.initialize().then((_) {
      emit(state.copyWith(
        loaded: true,
      ));
      state.controller.play();
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }

  void togglePlay() {
    state.playing ? state.controller.pause() : state.controller.play();
    emit(state.copyWith(
      playing: !state.playing,
    ));
  }

  void toggleControlsVisibility() {
    emit(state.copyWith(
      controlsVisible: !state.controlsVisible,
    ));
    if (state.controlsVisible && state.controlsVisible) {
      togglePlay();
    }
  }

  void setVolume(
    double value,
  ) {
    state.controller.setVolume(value);
    emit(state.copyWith(
      volume: value,
    ));
  }

  void toggleMute() {
    var newState = state.copyWith(
      volume: state.mute ? state.volumeBeforeMute : 0,
      volumeBeforeMute: state.notMute ? state.volume : state.volumeBeforeMute,
    );
    state.controller.setVolume(newState.volume);
    emit(newState);
  }
}
