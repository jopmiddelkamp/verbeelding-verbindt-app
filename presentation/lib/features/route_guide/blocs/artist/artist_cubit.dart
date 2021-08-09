import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'artist_state.dart';

class ArtistCubit extends CubitBase<ArtistState> {
  ArtistCubit() : super(const ArtistState.initializing());

  Future<void> init({
    required ArtistEntity artist,
  }) async {
    emit(ArtistState.loaded(
      artist: artist,
    ));
  }
}
