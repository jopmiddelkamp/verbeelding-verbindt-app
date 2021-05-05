import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class ArtistDetailsState extends StateBase {
  ArtistDetailsState._({
    required this.artist,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory ArtistDetailsState.initialize({
    required ArtistEntity artist,
  }) {
    return ArtistDetailsState._(
      artist: artist,
      failure: null,
    );
  }

  final ArtistEntity artist;

  @override
  String toString() => '''$runtimeType { 
                            artist: $artist, 
                            failure: $failure, 
                          }''';

  ArtistDetailsState copyWith({
    Failure? failure,
  }) {
    return ArtistDetailsState._(
      artist: artist,
      failure: failure ?? this.failure,
    );
  }
}
