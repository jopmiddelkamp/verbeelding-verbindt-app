import '../entities/common/artist.dart';
import 'repository_base.dart';

abstract class ArtistRepository extends RepositoryBase {
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
