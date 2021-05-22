import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';
import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:video_player/video_player.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/loading_indicators/circle_loading_indicator.dart';
import 'video_controls.dart';
import 'video_cubit.dart';
import 'video_state.dart';

class Video extends StatelessWidget {
  const Video._(
    this.video, {
    Key? key,
  }) : super(key: key);

  static Widget blocProvider(
    VideoEntity video,
  ) {
    return BlocProvider(
      create: (_) {
        return VideoCubit(video);
      },
      child: Video._(video),
    );
  }

  final VideoEntity video;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: video.aspectRatio,
      child: BlocBuilder<VideoCubit, VideoState>(
        buildWhen: (previous, current) {
          return previous.loaded != current.loaded;
        },
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: 300.milliseconds,
            child: _buildInternal(
              context,
              state: snapshot,
            ),
          );
        },
      ),
    );
  }

  Widget _buildInternal(
    BuildContext context, {
    required VideoState state,
  }) {
    if (state.loaded != true) {
      return VVCircleLoadingIndicator(
        text: (context, _) {
          // TODO: move to shared translation
          return context.l10n.artistDetailsPage.busyLoadingVideo;
        },
      );
    }
    return _buildVideo(
      context,
      state: state,
    );
  }

  Widget _buildVideo(
    BuildContext context, {
    required VideoState state,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        VideoPlayer(
          state.controller!,
        ),
        VideoControls.blocProvider(
          state.controller!,
        ),
        VideoProgressIndicator(
          state.controller!,
          allowScrubbing: true,
          colors: VideoProgressColors(
            backgroundColor: Colors.black12,
            bufferedColor: context.theme.colorScheme.primary.withOpacity(0.4),
            playedColor: context.theme.colorScheme.primary.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}
