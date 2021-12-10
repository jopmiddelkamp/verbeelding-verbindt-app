import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_data_firebase.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  ArtistRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _artistCollection =
            firestore.collection('artists').withConverter<ArtistDataModel>(
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
  Stream<List<ArtistGeoLocation>> streamArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async* {
    final query = _filterArtistsBySpeciality(specialityIds);

    yield* query.snapshots().map<List<ArtistGeoLocation>>((snapshot) {
      final artists = snapshot.docs.map<ArtistGeoLocation>((doc) {
        return doc.data().toGeoLocation();
      }).toList(growable: false);
      return artists;
    });
  }

  @override
  Future<List<ArtistGeoLocation>> getArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async {
    final query = _filterArtistsBySpeciality(specialityIds);

    final result = await query.get();

    return result.docs.map<ArtistGeoLocation>((doc) {
      return doc.data().toGeoLocation();
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
