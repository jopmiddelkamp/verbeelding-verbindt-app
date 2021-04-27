import '../../../common/services/service_base.dart';
import '../models/artist_model.dart';
import '../repositories/artist/artist_repository.dart';

abstract class ArtistService {
  Stream<List<ArtistModel>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistModel>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}

class ArtistServiceImpl extends ServiceBase implements ArtistService {
  const ArtistServiceImpl({
    required final ArtistRepository artistRepository,
  }) : _artistRepository = artistRepository;

  final ArtistRepository _artistRepository;

  @override
  Stream<List<ArtistModel>> streamArtistsBySpeciality(
    List<String> specialityIds,
  ) {
    return _artistRepository.streamArtistsBySpeciality(
      specialityIds,
    );
  }

  @override
  Future<List<ArtistModel>> getArtistsBySpeciality(
    List<String> specialityIds,
  ) {
    return _artistRepository.getArtistsBySpeciality(
      specialityIds,
    );
  }
}
