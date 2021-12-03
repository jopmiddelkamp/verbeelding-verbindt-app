import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'artist_details_state.freezed.dart';

@freezed
class ArtistDetailsState with _$ArtistDetailsState {
  const factory ArtistDetailsState.initializing() = ArtistDetailsInitializing;

  const factory ArtistDetailsState.loaded({
    required ArtistEntity artist,
    required YoutubePlayerController youtubeController,
  }) = ArtistDetailsLoaded;

  const factory ArtistDetailsState.failed() = ArtistDetailsFailed;
}
