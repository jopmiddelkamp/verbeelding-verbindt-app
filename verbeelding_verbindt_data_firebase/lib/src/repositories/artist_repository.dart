import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

class ArtistRepositoryImpl implements ArtistRepository {
  ArtistRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _artistCollection =
            firestore.collection('artists').withConverter<ArtistDataModel>(
          fromFirestore: (snapshot, _) {
            final json = snapshot.data()!;
            return ArtistDataModel.fromJson(
              json,
            ).copyWith(
              id: snapshot.id,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<ArtistDataModel> _artistCollection;

  @override
  Stream<List<Artist>> streamArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async* {
    final query = _filterArtistsBySpeciality(specialityIds);

    yield* query.snapshots().map<List<Artist>>((snapshot) {
      final artists = snapshot.docs.map<Artist>((doc) {
        return doc.data().toEntity();
      }).toList(growable: false);
      return artists;
    });
  }

  @override
  Future<List<Artist>> getArtistsBySpeciality(
    Iterable<String> specialityIds,
  ) async {
    final query = _filterArtistsBySpeciality(specialityIds);

    final result = await query.get();

    return result.docs.map<Artist>((doc) {
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

  @override
  Future<Artist?> getArtist(String id) async {
    final snapshot = await _artistCollection.doc(id).get();
    return snapshot.data()?.toEntity();
  }

  @override
  Stream<Artist?> streamArtist(String id) {
    return _artistCollection.doc(id).snapshots().map((snapshot) {
      return snapshot.data()?.toEntity();
    });
  }
}
