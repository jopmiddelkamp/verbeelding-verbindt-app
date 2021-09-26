import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/video/bloc.dart';
import '../../../extensions/build_context_extensions.dart';

class PlayControl extends StatelessWidget {
  const PlayControl({
    Key? key,
    required this.iconSize,
  }) : super(key: key);

  final double iconSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<VideoCubit, VideoState>(
      buildWhen: _buildWhen,
      builder: (_, state) {
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

  GestureDetector _buildLoadedState(
    BuildContext context, {
    required VideoLoaded state,
  }) {
    return GestureDetector(
      onTap: context.cubit<VideoCubit>().togglePlay,
      child: Icon(
        state.playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }

  bool _buildWhen(
    VideoState previous,
    VideoState current,
  ) {
    return previous is VideoLoaded &&
        current is VideoLoaded &&
        previous.playing != current.playing;
  }
}
