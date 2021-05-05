import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/video.dart';
import 'package:video_player/video_player.dart';

import '../../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';

class IntroVideo extends StatelessWidget {
  const IntroVideo({
    Key? key,
    required this.video,
    required this.controller,
  }) : super(key: key);

  final VideoEntity video;
  final VideoPlayerController? controller;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: video.aspectRatio,
      child: _buildInternal(),
    );
  }

  Widget _buildInternal() {
    if (controller == null) {
      return VVCircleLoadingIndicator(
        label: 'Bezig met laden van de video..',
      );
    }
    return VideoPlayer(controller!);
  }
}
