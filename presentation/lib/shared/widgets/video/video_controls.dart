import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';
import 'package:video_player/video_player.dart';

import '../../extensions/build_context_extensions.dart';
import 'controls/audio_control.dart';
import 'controls/play_control.dart';
import 'controls/progress_indicator_control.dart';
import 'video_controls_cubit.dart';
import 'video_controls_state.dart';

class VideoControls extends StatelessWidget {
  const VideoControls._(
    this.controller, {
    Key? key,
    this.iconSize = 36,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 4.0,
    ),
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
  final double iconSize;
  final EdgeInsets padding;

  static const _heightProgressControl = 4.0;

  double get _height => iconSize + _heightProgressControl + padding.vertical;

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.blocProvider<VideoControlsCubit>();
    return GestureDetector(
      onTap: cubit.toggleVisibility,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: _height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BlocBuilder<VideoControlsCubit, VideoControlsState>(
                  buildWhen: (previous, current) {
                    return previous.initialLoad != current.initialLoad ||
                        previous.isVisible != current.isVisible;
                  },
                  builder: (context, state) {
                    return TweenAnimationBuilder<Offset?>(
                      duration: 150.milliseconds,
                      tween: Tween<Offset>(
                        begin: state.isVisible
                            ? Offset(0.0, _height * -1)
                            : Offset(0.0, 0.0),
                        end: state.isVisible
                            ? Offset(0.0, 0.0)
                            : Offset(0.0, _height * -1),
                      ),
                      builder: (_, value, child) {
                        return Positioned(
                          height: _height,
                          left: 0.0,
                          right: 0.0,
                          bottom: value?.dy ?? _height * -1,
                          child: child!,
                        );
                      },
                      child: _buildBar(context, cubit: cubit),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(
    BuildContext context, {
    required VideoControlsCubit cubit,
  }) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayControl(
                  iconSize: iconSize,
                ),
                AudioControl(
                  iconSize: iconSize,
                ),
              ],
            ),
          ),
          ProgressIndicatorControl(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
