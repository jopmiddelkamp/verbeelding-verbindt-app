import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercharged/supercharged.dart';
import 'package:video_player/video_player.dart';

import '../../blocs/video/bloc.dart';
import '../../extensions/build_context_extensions.dart';
import 'controls/audio_control.dart';
import 'controls/play_control.dart';
import 'controls/progress_indicator_control.dart';

class VideoControls extends HookWidget {
  const VideoControls({
    this.iconSize = 36,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 4.0,
    ),
    Key? key,
  }) : super(key: key);

  final double iconSize;
  final EdgeInsets padding;

  static const heightProgressControl = 4.0;

  double get height => iconSize + heightProgressControl + padding.vertical;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<VideoCubit, VideoState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) => _buildLoadedState(
            context,
            state: state,
          ),
          orElse: () => Container(),
        );
      },
    );
  }

  bool _buildWhen(
    VideoState previous,
    VideoState current,
  ) {
    return previous is VideoLoaded &&
        current is VideoLoaded &&
        previous.controlsVisible != current.controlsVisible;
  }

  Widget _buildLoadedState(
    BuildContext context, {
    required VideoLoaded state,
  }) {
    final animationController = useAnimationController(
      duration: 100.milliseconds,
      initialValue: state.controlsVisible ? 1 : 0,
    );
    return GestureDetector(
      onTap: context.cubit<VideoCubit>().toggleControlsVisibility,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromLTRB(0, 0, 0, height * -1),
                    end: RelativeRect.fromLTRB(0, height, 0, 0),
                  ).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeIn,
                    reverseCurve: Curves.easeOut,
                  )),
                  child: _buildBar(
                    context,
                    controller: state.controller,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(
    BuildContext context, {
    required VideoPlayerController controller,
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
