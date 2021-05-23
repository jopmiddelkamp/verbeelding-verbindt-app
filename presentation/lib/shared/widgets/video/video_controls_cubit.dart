import 'package:video_player/video_player.dart';

import '../../bloc/cubit_base.dart';
import 'video_controls_state.dart';

class VideoControlsCubit extends CubitBase<VideoControlsState> {
  VideoControlsCubit(
    VideoPlayerController controller,
  ) : super(VideoControlsState.initialize(
          controller: controller,
        ));

  void togglePlay() {
    state.isPlaying ? state.controller.pause() : state.controller.play();
    emit(state.copyWith(
      isPlaying: !state.isPlaying,
    ));
  }

  void toggleVisibility() {
    emit(state.copyWith(
      isVisible: !state.isVisible,
    ));
    if (state.isNotVisible && state.isNotPlaying) {
      togglePlay();
    }
  }

  void setVolume(
    double value,
  ) {
    state.controller.setVolume(value);
    emit(state.copyWith(
      volume: value,
    ));
  }

  void toggleMute() {
    var newState = state.copyWith(
      volume: state.isMute ? state.volumeBeforeMute : 0,
      volumeBeforeMute: state.isNotMute ? state.volume : state.volumeBeforeMute,
    );
    state.controller.setVolume(newState.volume);
    emit(newState);
  }
}
