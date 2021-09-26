import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

import '../../../../../shared/blocs/cubit_base.dart';
import 'artist_details_state.dart';

class ArtistDetailsCubit extends CubitBase<ArtistDetailsState> {
  ArtistDetailsCubit() : super(const ArtistDetailsState.initializing());

  Future<void> init({
    required ArtistEntity artist,
  }) async {
    emit(ArtistDetailsState.loaded(
      artist: artist,
    ));
  }
}
