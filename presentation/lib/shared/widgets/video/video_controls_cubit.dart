import 'package:video_player/video_player.dart';

import '../../bloc/cubit_base.dart';
import 'video_controls_state.dart';

class VideoControlsCubit extends CubitBase<VideoControlsState> {
  VideoControlsCubit(
    VideoPlayerController controller,
  ) : super(VideoControlsState.initialize(
          controller: controller,
        )) {
    controller.addListener(() {
      var isDirty = false;
      var newState = state;
      if (controller.value.isPlaying != state.isPlaying) {
        newState = newState.copyWith(
          isPlaying: controller.value.isPlaying,
        );
        isDirty = true;
      }
      if (isDirty) {
        emit(newState);
      }
    });
  }
}
