import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

part 'artist_details_state.freezed.dart';

@freezed
class ArtistDetailsState with _$ArtistDetailsState {
  const factory ArtistDetailsState.initializing() = ArtistDetailsInitializing;

  const factory ArtistDetailsState.loaded({
    required ArtistEntity artist,
  }) = ArtistDetailsLoaded;

  const factory ArtistDetailsState.failed() = ArtistDetailsFailed;
}
