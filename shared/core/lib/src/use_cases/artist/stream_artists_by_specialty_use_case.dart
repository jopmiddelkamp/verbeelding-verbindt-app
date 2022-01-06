import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamArtistBySpecialtyUseCase extends UseCase<Stream<List<Artist>>,
    StreamArtistBySpecialtyUseCaseParams> {
  StreamArtistBySpecialtyUseCase({
    required ArtistRepository artistRepository,
  }) : _artistRepository = artistRepository;

  final ArtistRepository _artistRepository;

  @override
  Stream<List<Artist>> call(
    StreamArtistBySpecialtyUseCaseParams params,
  ) async* {
    yield* _artistRepository.streamArtistsBySpeciality(
      params.specialityIds,
    );
  }
}

class StreamArtistBySpecialtyUseCaseParams {
  const StreamArtistBySpecialtyUseCaseParams({
    required this.artistId,
    required this.specialityIds,
  });
  final String artistId;
  final List<String> specialityIds;
}
