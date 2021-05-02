import '../entities/artist.dart';
import '../repositories/artist_repository.dart';
import '../services/service_base.dart';

abstract class ArtistService {
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}

class ArtistServiceImpl extends ServiceBase implements ArtistService {
  const ArtistServiceImpl({
    required final ArtistRepository artistRepository,
  }) : _artistRepository = artistRepository;

  final ArtistRepository _artistRepository;

  @override
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    List<String> specialityIds,
  ) {
    return _artistRepository.streamArtistsBySpeciality(
      specialityIds,
    );
  }

  @override
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    List<String> specialityIds,
  ) {
    return _artistRepository.getArtistsBySpeciality(
      specialityIds,
    );
  }
}
