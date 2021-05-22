import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/cubit_base.dart';
import 'video_state.dart';

class VideoCubit extends CubitBase<VideoState> {
  VideoCubit(
    VideoEntity video,
  ) : super(VideoState.initialize(
          video: video,
        )) {
    final controller = VideoPlayerController.network(
      video.url,
      formatHint: VideoFormat.hls,
    );
    controller.initialize().then((_) {
      emit(state.copyWith(
        controller: controller,
      ));
      controller.play();
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }
}
