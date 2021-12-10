import '../../verbeelding_verbindt_core.dart';

abstract class ArtistRepository extends RepositoryBase {
  Stream<List<ArtistGeoLocation>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistGeoLocation>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
