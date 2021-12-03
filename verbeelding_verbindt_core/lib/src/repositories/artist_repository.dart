import '../../verbeelding_verbindt_core.dart';

abstract class ArtistRepository extends RepositoryBase {
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
