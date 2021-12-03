import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';

import '../../../extensions/artist_mapper_extensions.dart';
import '../../../models/artist.dart';

class FirestoreArtistRepository extends ArtistRepository {
  FirestoreArtistRepository({
    FirebaseFirestore? firestore,
  }) : _artistCollection = (firestore ?? FirebaseFirestore.instance)
            .collection('artists')
            .withConverter<ArtistDataModel>(
          fromFirestore: (snapshot, _) {
            return ArtistDataModel.fromFirebaseMap(
              id: snapshot.id,
              map: snapshot.data()!,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<ArtistDataModel> _artistCollection;

  @override
  Stream<List<ArtistEntity>> streamArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async* {
    final query = _filterArtistsBySpeciality(specialityIds);

    yield* query.snapshots().map<List<ArtistEntity>>((snapshot) {
      final artists = snapshot.docs.map<ArtistEntity>((doc) {
        return doc.data().toEntity();
      }).toList(growable: false);
      return artists;
    });
  }

  @override
  Future<List<ArtistEntity>> getArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async {
    final query = _filterArtistsBySpeciality(specialityIds);

    final result = await query.get();

    return result.docs.map<ArtistEntity>((doc) {
      return doc.data().toEntity();
    }).toList(growable: false);
  }

  Query<ArtistDataModel> _filterArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) {
    // ignore: unnecessary_cast
    var query = _artistCollection as Query<ArtistDataModel>;
    if (specialityIds.isNotEmpty == true) {
      query = query.where(
        'specialitiesKeys',
        arrayContainsAny: specialityIds.toList(),
      );
    }
    return query;
  }
}
