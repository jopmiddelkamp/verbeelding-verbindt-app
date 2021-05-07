import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';

import '../../../extensions/artist_mapper_extensions.dart';
import '../../../models/artist.dart';

class FirestoreArtistRepository implements ArtistRepository {
  FirestoreArtistRepository()
      : _artistCollection = FirebaseFirestore.instance.collection('artists');

  final CollectionReference _artistCollection;

  @override
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async* {
    final query = _filterArtistsBySpeciality(specialityIds);

    yield* query.snapshots().map<List<ArtistEntity>>((snapshot) {
      final artists = snapshot.docs
          .map((doc) => ArtistDataModel.fromFirebaseMap(
                id: doc.id,
                map: doc.data(),
              ))
          .toList(growable: false);
      return artists.toEntityList();
    });
  }

  @override
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async {
    final query = _filterArtistsBySpeciality(specialityIds);

    final result = await query.get();

    return result.docs
        .map((doc) => ArtistDataModel.fromFirebaseMap(
              id: doc.id,
              map: doc.data(),
            ).toEntity())
        .toList(growable: false);
  }

  Query _filterArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) {
    // ignore: unnecessary_cast
    var query = _artistCollection as Query;
    if (specialityIds.isNotEmpty == true) {
      query = query.where(
        'specialitiesKeys',
        arrayContainsAny: specialityIds.toList(),
      );
    }
    return query;
  }
}
