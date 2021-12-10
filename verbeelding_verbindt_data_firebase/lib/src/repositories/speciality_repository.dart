import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_data_firebase.dart';

class SpecialityRepositoryImpl extends SpecialityRepository {
  SpecialityRepositoryImpl({
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
  Stream<List<SpecialityGeoLocation>> getSpecialities() {
    return _specialityCollection
        .snapshots()
        .map<List<SpecialityGeoLocation>>((docs) {
      return docs.docs
          .map<SpecialityGeoLocation>((doc) => doc.data().toGeoLocation())
          .toList(growable: false);
    });
  }
}
