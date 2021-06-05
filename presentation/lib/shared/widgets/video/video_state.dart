import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/state_base.dart';

class VideoState extends StateBase {
  VideoState._({
    required this.video,
    required this.controller,
    required this.loaded,
    required this.controlsVisible,
    required this.controlsVisiblePrevious,
    required this.playing,
    required this.volume,
    required this.volumeBeforeMute,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory VideoState.initialize({
    required VideoEntity video,
    required bool autoPlay,
    required bool controlsVisible,
  }) {
    final controller = VideoPlayerController.network(
      video.url,
      formatHint: VideoFormat.hls,
    );
    return VideoState._(
      video: video,
      controller: controller,
      loaded: false,
      controlsVisible: controlsVisible,
      controlsVisiblePrevious: controlsVisible,
      playing: autoPlay,
      volume: controller.value.volume,
      volumeBeforeMute: controller.value.volume,
      failure: null,
    );
  }

  final VideoEntity video;
  final VideoPlayerController controller;
  final bool loaded;

  final bool controlsVisible;
  final bool controlsVisiblePrevious;
  final bool playing;
  final double volume;
  final double volumeBeforeMute;

  bool get notLoaded => !loaded;
  bool get visibilityChanged => controlsVisible != controlsVisiblePrevious;
  bool get visibilityNotChanged => !visibilityChanged;
  bool get notPlaying => !playing;
  bool get controlsNotVisible => !controlsVisible;
  bool get mute => volume <= 0;
  bool get notMute => volume > 0;

  VideoState copyWith({
    VideoPlayerController? controller,
    bool? loaded,
    bool? controlsVisible,
    bool? playing,
    double? volume,
    double? volumeBeforeMute,
    Failure? failure,
  }) {
    var controlsVisiblePrevious = this.controlsVisiblePrevious;
    if (controlsVisible != null) {
      controlsVisiblePrevious = !controlsVisible;
    }
    return VideoState._(
      video: video,
      controller: controller ?? this.controller,
      loaded: loaded ?? this.loaded,
      controlsVisible: controlsVisible ?? this.controlsVisible,
      controlsVisiblePrevious: controlsVisiblePrevious,
      playing: playing ?? this.playing,
      volume: volume ?? this.volume,
      volumeBeforeMute: volumeBeforeMute ?? this.volumeBeforeMute,
      failure: failure ?? this.failure,
    );
  }

  @override
  Future<void> dispose() {
    controller.dispose();
    return super.dispose();
  }
}
