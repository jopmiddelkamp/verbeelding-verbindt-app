import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamArtistBySpecialtyUseCase extends UseCase<
    Stream<List<ArtistGeoLocation>>, StreamArtistBySpecialtyUseCaseArguments> {
  StreamArtistBySpecialtyUseCase({
    required ArtistRepository artistRepository,
  }) : _artistRepository = artistRepository;

  final ArtistRepository _artistRepository;

  // TODO: rewrite with Either with non nullable RouteGeoLocation and OpenRouteUseCaseFailure union
  @override
  Future<Stream<List<ArtistGeoLocation>>> call(
    StreamArtistBySpecialtyUseCaseArguments argument,
  ) async {
    return _artistRepository.streamArtistsBySpeciality(
      argument.specialityIds,
    );
  }
}

class StreamArtistBySpecialtyUseCaseArguments {
  const StreamArtistBySpecialtyUseCaseArguments({
    required this.artistId,
    required this.specialityIds,
  });
  final String artistId;
  final List<String> specialityIds;
}
