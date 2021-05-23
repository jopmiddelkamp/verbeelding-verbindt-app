import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';
import 'package:video_player/video_player.dart';

import '../../extensions/build_context_extensions.dart';
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

  static const _iconSize = 36.0;

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
          BlocBuilder<VideoControlsCubit, VideoControlsState>(
            buildWhen: (previous, current) {
              return previous.isVisible != current.isVisible;
            },
            builder: (_, state) {
              return AnimatedSwitcher(
                duration: 50.milliseconds,
                reverseDuration: 200.milliseconds,
                child: state.isVisible
                    ? _buildControls(context, cubit: cubit)
                    : Container(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildControls(
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
              children: [
                _buildPlayPauseControl(cubit: cubit),
                Expanded(child: Container()),
                _buildAudioControl(cubit: cubit),
              ],
            ),
          ),
          _buildProgressControl(context)
        ],
      ),
    );
  }

  Widget _buildPlayPauseControl({
    required VideoControlsCubit cubit,
  }) {
    return BlocBuilder<VideoControlsCubit, VideoControlsState>(
      buildWhen: (previous, current) {
        return previous.isPlaying != current.isPlaying;
      },
      builder: (_, state) {
        return GestureDetector(
          key: ValueKey(state.isPlaying),
          onTap: cubit.togglePlay,
          child: Icon(
            state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: _iconSize,
          ),
        );
      },
    );
  }

  Widget _buildAudioControl({
    required VideoControlsCubit cubit,
  }) {
    IconData _determineVolumeIcon(
      double volume,
    ) {
      if (volume == 0) {
        return Icons.volume_off_rounded;
      }
      if (volume < 0.25) {
        return Icons.volume_mute_rounded;
      }
      if (volume < 0.5) {
        return Icons.volume_down_rounded;
      }
      return Icons.volume_up_rounded;
    }

    return BlocBuilder<VideoControlsCubit, VideoControlsState>(
      buildWhen: (previous, current) {
        return previous.volume != current.volume;
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: _iconSize,
              child: Slider(
                value: state.volume,
                onChanged: cubit.setVolume,
              ),
            ),
            GestureDetector(
              onTap: cubit.toggleMute,
              child: Icon(
                _determineVolumeIcon(state.volume),
                color: Colors.white,
                size: _iconSize,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProgressControl(
    BuildContext context,
  ) {
    return VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      colors: VideoProgressColors(
        backgroundColor: Colors.transparent,
        bufferedColor: context.theme.colorScheme.primary.withOpacity(0.4),
        playedColor: context.theme.colorScheme.primary.withOpacity(0.8),
      ),
    );
  }
}
