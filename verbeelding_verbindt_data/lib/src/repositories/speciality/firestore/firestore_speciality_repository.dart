import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../verbeelding_verbindt_data.dart';

class FirestoreSpecialityRepository extends SpecialityRepository {
  FirestoreSpecialityRepository({
    FirebaseFirestore? firestore,
  }) : _specialityCollection = (firestore ?? FirebaseFirestore.instance)
            .collection('specialities')
            .withConverter<SpecialityDataModel>(
          fromFirestore: (snapshot, _) {
            return SpecialityDataModel.fromFirebaseMap(
              snapshot.id,
              snapshot.data()!,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<SpecialityDataModel> _specialityCollection;

  @override
  Stream<List<SpecialityEntity>> getSpecialities() {
    return _specialityCollection
        .snapshots()
        .map<List<SpecialityEntity>>((docs) {
      return docs.docs
          .map<SpecialityEntity>((doc) => doc.data().toEntity())
          .toList(growable: false);
    });
  }
}
