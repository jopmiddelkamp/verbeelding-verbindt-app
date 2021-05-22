import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/state_base.dart';

class VideoControlsState extends StateBase {
  VideoControlsState._({
    required this.controller,
    required this.isPlaying,
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
      failure: null,
    );
  }

  final VideoPlayerController controller;
  final bool isPlaying;

  @override
  String toString() => '''$runtimeType { 
                            controller: $controller, 
                            isPlaying: $isPlaying, 
                            failure: $failure, 
                          }''';

  VideoControlsState copyWith({
    VideoPlayerController? controller,
    bool? isPlaying,
    Failure? failure,
  }) {
    return VideoControlsState._(
      controller: controller ?? this.controller,
      isPlaying: isPlaying ?? this.isPlaying,
      failure: failure ?? this.failure,
    );
  }
}
