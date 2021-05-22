import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/state_base.dart';

class VideoState extends StateBase {
  VideoState._({
    required this.video,
    required this.controller,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory VideoState.initialize({
    required VideoEntity video,
  }) {
    return VideoState._(
      video: video,
      controller: null,
      failure: null,
    );
  }

  final VideoEntity video;
  final VideoPlayerController? controller;

  bool get loaded => controller != null;

  @override
  String toString() => '''$runtimeType { 
                            video: $video, 
                            controller: $controller, 
                            loaded: $loaded,
                            failure: $failure, 
                          }''';

  VideoState copyWith({
    VideoPlayerController? controller,
    Failure? failure,
  }) {
    return VideoState._(
      video: video,
      controller: controller ?? this.controller,
      failure: failure ?? this.failure,
    );
  }

  @override
  Future<void> dispose() {
    controller?.dispose();
    return super.dispose();
  }
}
