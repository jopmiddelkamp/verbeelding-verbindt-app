import '../entities/common/artist.dart';

abstract class ArtistRepository {
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
