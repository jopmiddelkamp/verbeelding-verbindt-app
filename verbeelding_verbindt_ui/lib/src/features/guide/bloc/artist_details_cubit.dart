import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class ArtistDetailsCubit extends CubitBase<ArtistDetailsState> {
  ArtistDetailsCubit() : super(const ArtistDetailsState.initializing());

  Future<void> init({
    required ArtistEntity artist,
  }) async {
    emit(ArtistDetailsState.loaded(
      artist: artist,
      youtubeController: YoutubePlayerController(
        initialVideoId: artist.detailsContent.video.videoId,
      ),
    ));
  }
}
