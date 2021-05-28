import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/state_base.dart';

class VideoControlsState extends StateBase {
  VideoControlsState._({
    required this.controller,
    required this.isPlaying,
    required this.volume,
    required this.volumeBeforeMute,
    required this.isVisible,
    required this.initialLoad,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory VideoControlsState.initialize({
    required VideoPlayerController controller,
  }) {
    return VideoControlsState._(
      controller: controller,
      isPlaying: controller.value.isPlaying,
      volume: controller.value.volume,
      volumeBeforeMute: controller.value.volume,
      isVisible: false,
      initialLoad: true,
      failure: null,
    );
  }

  final VideoPlayerController controller;
  final bool isPlaying;
  final double volume;
  final double volumeBeforeMute;
  final bool isVisible;
  final bool initialLoad;

  bool get isNotPlaying => !isPlaying;
  bool get isNotVisible => !isVisible;
  bool get isMute => volume <= 0;
  bool get isNotMute => volume > 0;

  VideoControlsState copyWith({
    VideoPlayerController? controller,
    bool? isPlaying,
    double? volume,
    double? volumeBeforeMute,
    bool? isVisible,
    Failure? failure,
  }) {
    return VideoControlsState._(
      controller: controller ?? this.controller,
      isPlaying: isPlaying ?? this.isPlaying,
      volume: volume ?? this.volume,
      volumeBeforeMute: volumeBeforeMute ?? this.volumeBeforeMute,
      isVisible: isVisible ?? this.isVisible,
      initialLoad: false,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() {
    return "$runtimeType { isPlaying: $isPlaying, volume: $volume, volumeBeforeMute: $volumeBeforeMute, visible: $isVisible, initalLoad: $initialLoad }";
  }
}
