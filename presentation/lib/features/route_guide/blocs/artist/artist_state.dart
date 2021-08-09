import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

part 'artist_state.freezed.dart';

@freezed
class ArtistState with _$ArtistState {
  const factory ArtistState.initializing() = ArtistDetailsInitializingState;

  const factory ArtistState.loaded({
    required ArtistEntity artist,
  }) = ArtistDetailsLoadedState;

  const factory ArtistState.failed() = ArtistDetailsFailureState;
}
