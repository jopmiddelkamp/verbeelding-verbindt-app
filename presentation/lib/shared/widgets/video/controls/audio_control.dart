import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/video/bloc.dart';
import '../../../extensions/build_context_extensions.dart';

class AudioControl extends StatelessWidget {
  const AudioControl({
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

  Widget _buildLoadedState(
    BuildContext context, {
    required VideoLoaded state,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: iconSize,
          child: Slider(
            value: state.volume,
            onChanged: context.cubit<VideoCubit>().setVolume,
          ),
        ),
        GestureDetector(
          onTap: context.cubit<VideoCubit>().toggleMute,
          child: Icon(
            _determineVolumeIcon(state.volume),
            color: Colors.white,
            size: iconSize,
          ),
        ),
      ],
    );
  }

  bool _buildWhen(
    VideoState previous,
    VideoState current,
  ) {
    return previous is VideoLoaded &&
        current is VideoLoaded &&
        previous.volume != current.volume;
  }

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
}
