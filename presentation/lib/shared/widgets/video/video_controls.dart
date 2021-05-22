import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'video_controls_cubit.dart';
import 'video_controls_state.dart';

class VideoControls extends StatelessWidget {
  const VideoControls._(
    this.controller, {
    Key? key,
  }) : super(key: key);

  static Widget blocProvider(
    VideoPlayerController controller,
  ) {
    return BlocProvider(
      create: (_) {
        return VideoControlsCubit(controller);
      },
      child: VideoControls._(controller),
    );
  }

  final VideoPlayerController controller;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Stack(
      children: <Widget>[
        BlocBuilder<VideoControlsCubit, VideoControlsState>(
          buildWhen: (previous, current) {
            return previous.isPlaying != current.isPlaying;
          },
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 50),
              reverseDuration: Duration(milliseconds: 200),
              child: controller.value.isPlaying
                  ? SizedBox.shrink()
                  : Container(
                      color: Colors.black26,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 100.0,
                        ),
                      ),
                    ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
