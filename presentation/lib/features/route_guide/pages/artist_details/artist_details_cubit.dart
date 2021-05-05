import '../../../../shared/bloc/cubit_base.dart';
import 'artist_details_page.dart';
import 'artist_details_state.dart';

class ArtistDetailsCubit extends CubitBase<ArtistDetailsState> {
  ArtistDetailsCubit(
    ArtistDetailsPageArguments arguments,
  ) : super(ArtistDetailsState.initialize(
          artist: arguments.artist,
        ));
}
