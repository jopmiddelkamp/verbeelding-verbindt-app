import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

import '../../../../shared/bloc/state_base.dart';

class ArtistDetailsState extends StateBase {
  ArtistDetailsState._({
    required this.artist,
    required this.videoController,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory ArtistDetailsState.initialize({
    required ArtistEntity artist,
  }) {
    return ArtistDetailsState._(
      artist: artist,
      videoController: null,
      failure: null,
    );
  }

  final ArtistEntity artist;
  final VideoPlayerController? videoController;

  @override
  String toString() => '''$runtimeType { 
                            artist: $artist, 
                            videoController: $videoController, 
                            failure: $failure, 
                          }''';

  ArtistDetailsState copyWith({
    VideoPlayerController? videoController,
    Failure? failure,
  }) {
    return ArtistDetailsState._(
      artist: artist,
      videoController: videoController ?? this.videoController,
      failure: failure ?? this.failure,
    );
  }

  @override
  Future<void> dispose() {
    videoController?.dispose();
    return super.dispose();
  }
}
