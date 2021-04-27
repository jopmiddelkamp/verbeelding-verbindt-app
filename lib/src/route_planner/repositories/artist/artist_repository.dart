import '../../models/artist_model.dart';

abstract class ArtistRepository {
  Stream<List<ArtistModel>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<ArtistModel>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
