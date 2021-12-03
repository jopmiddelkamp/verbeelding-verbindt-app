import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../shared/blocs/cubit_base.dart';
import 'artist_details_state.dart';

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
