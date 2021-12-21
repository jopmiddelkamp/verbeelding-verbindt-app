import '../../verbeelding_verbindt_core.dart';

abstract class ArtistRepository {
  Stream<Artist?> streamArtist(
    String id,
  );
  Future<Artist?> getArtist(
    String id,
  );
  Stream<List<Artist>> streamArtistsBySpeciality(
    List<String> specialityIds,
  );
  Future<List<Artist>> getArtistsBySpeciality(
    List<String> specialityIds,
  );
}
