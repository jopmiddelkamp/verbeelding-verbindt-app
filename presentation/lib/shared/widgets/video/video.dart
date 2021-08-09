import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';
import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:video_player/video_player.dart';

import '../../blocs/video/bloc.dart';
import '../../extensions/build_context_extensions.dart';
import '../../widgets/loading_indicators/circle_loading_indicator.dart';
import '../bloc/failure_state_display.dart';
import 'video_controls.dart';

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
        buildWhen: _buildWhen,
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: 300.milliseconds,
            child: _buildInternal(
              context,
              state: state,
            ),
          );
        },
      ),
    );
  }

  bool _buildWhen(
    VideoState previous,
    VideoState current,
  ) {
    return previous.runtimeType != current.runtimeType;
  }

  Widget _buildInternal(
    BuildContext context, {
    required VideoState state,
  }) {
    return state.map(
      initializing: (state) => VVCircleLoadingIndicator(
        text: (c, _) => c.l10n.artistDetailsPage
            .busyLoadingVideo, // TODO: move to shared translation
      ),
      loaded: (state) => _buildVideo(
        context,
        controller: state.controller,
      ),
      failed: (_) => const FailureStateDisplay(),
    );
  }

  Widget _buildVideo(
    BuildContext context, {
    required VideoPlayerController controller,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        VideoPlayer(
          controller,
        ),
        const VideoControls(),
      ],
    );
  }
}
