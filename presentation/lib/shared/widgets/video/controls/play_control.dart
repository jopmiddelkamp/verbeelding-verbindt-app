import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/build_context_extensions.dart';
import '../video_cubit.dart';
import '../video_state.dart';

class PlayControl extends StatelessWidget {
  const PlayControl({
    Key? key,
    required double iconSize,
  })  : _iconSize = iconSize,
        super(key: key);

  final double _iconSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.blocProvider<VideoCubit>();
    return BlocBuilder<VideoCubit, VideoState>(
      buildWhen: (previous, current) {
        return previous.playing != current.playing;
      },
      builder: (_, state) {
        return GestureDetector(
          onTap: cubit.togglePlay,
          child: Icon(
            state.playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: _iconSize,
          ),
        );
      },
    );
  }
}
