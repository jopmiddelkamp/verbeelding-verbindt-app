import 'package:video_player/video_player.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'artist_details_page.dart';
import 'artist_details_state.dart';

class ArtistDetailsCubit extends CubitBase<ArtistDetailsState> {
  ArtistDetailsCubit(
    ArtistDetailsPageArguments arguments,
  ) : super(ArtistDetailsState.initialize(
          artist: arguments.artist,
        )) {
    final controller = VideoPlayerController.network(
      arguments.artist.detailsContent.video.url,
      formatHint: VideoFormat.hls,
    );
    controller.initialize().then((_) {
      controller.play();
      emit(state.copyWith(
        videoController: controller,
      ));
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }
}
