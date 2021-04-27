import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/artist_model.dart';
import '../artist_repository.dart';

class FirestoreArtistRepository implements ArtistRepository {
  FirestoreArtistRepository()
      : _artistCollection = FirebaseFirestore.instance.collection('artists');

  final CollectionReference _artistCollection;

  @override
  Stream<List<ArtistModel>> streamArtistsBySpeciality(
    List<String> specialityIds,
  ) async* {
    final query = _filterArtistsBySpeciality(specialityIds);

    yield* query.snapshots().map<List<ArtistModel>>((snapshot) {
      final artists = snapshot.docs
          .map((doc) => ArtistModel.fromMap(
                id: doc.id,
                map: doc.data(),
              ))
          .toList(growable: false);
      return artists;
    });
  }

  @override
  Future<List<ArtistModel>> getArtistsBySpeciality(
    List<String> specialityIds,
  ) async {
    final query = _filterArtistsBySpeciality(specialityIds);

    final result = await query.get();

    return result.docs
        .map((doc) => ArtistModel.fromMap(
              id: doc.id,
              map: doc.data(),
            ))
        .toList(growable: false);
  }

  Query _filterArtistsBySpeciality(
    List<String> specialityIds,
  ) {
    // ignore: unnecessary_cast
    var query = _artistCollection as Query;
    if (specialityIds.isNotEmpty == true) {
      query = query.where(
        'specialitiesKeys',
        arrayContainsAny: specialityIds,
      );
    }
    return query;
  }
}
