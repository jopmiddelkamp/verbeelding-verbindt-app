import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../extensions/build_context_extensions.dart';

class ProgressIndicatorControl extends StatelessWidget {
  const ProgressIndicatorControl({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(
    BuildContext context,
  ) {
    return VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      padding: const EdgeInsets.all(0),
      colors: VideoProgressColors(
        backgroundColor: Colors.transparent,
        bufferedColor: context.theme.colorScheme.primary.withOpacity(0.4),
        playedColor: context.theme.colorScheme.primary.withOpacity(0.8),
      ),
    );
  }
}
