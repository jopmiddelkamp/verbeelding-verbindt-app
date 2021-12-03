import 'dart:async';

import '../../entities/artist.dart';
import '../../repositories/artist_repository.dart';
import '../use_case_base.dart';

class StreamArtistBySpecialtyUseCase extends UseCase<Stream<List<ArtistEntity>>,
    StreamArtistBySpecialtyUseCaseArguments> {
  StreamArtistBySpecialtyUseCase({
    required ArtistRepository artistRepository,
  }) : _artistRepository = artistRepository;

  final ArtistRepository _artistRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and OpenRouteUseCaseFailure union
  @override
  Future<Stream<List<ArtistEntity>>> call(
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
