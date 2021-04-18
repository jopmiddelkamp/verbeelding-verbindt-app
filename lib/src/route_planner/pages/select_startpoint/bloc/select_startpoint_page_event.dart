import 'package:equatable/equatable.dart';

import '../../../models/artist_model.dart';

abstract class SelectStartpointPageEvent extends Equatable {
  const SelectStartpointPageEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType {}';
}

class SelectStartpointInitialize extends SelectStartpointPageEvent {
  const SelectStartpointInitialize({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}

class SelectStartpointUpdateArtists extends SelectStartpointPageEvent {
  const SelectStartpointUpdateArtists(
    this.artists,
  );

  final List<ArtistModel> artists;

  @override
  String toString() => '$runtimeType { artistsCount: ${artists.length} }';
}

class SelectStartpointSelectArtist extends SelectStartpointPageEvent {
  const SelectStartpointSelectArtist(
    this.artist,
  );

  final ArtistModel artist;

  @override
  String toString() => '$runtimeType { artist: $artist }';
}
