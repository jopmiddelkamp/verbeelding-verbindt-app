import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

class SpecialityRepositoryImpl implements SpecialityRepository {
  SpecialityRepositoryImpl({
    FirebaseFirestore? firestore,
  }) : _specialityCollection = (firestore ?? FirebaseFirestore.instance)
            .collection('specialities')
            .withConverter<SpecialityDataModel>(
          fromFirestore: (snapshot, _) {
            final json = snapshot.data()!;
            return SpecialityDataModel.fromJson(
              json,
            ).copyWith(
              id: snapshot.id,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<SpecialityDataModel> _specialityCollection;

  @override
  Stream<List<Speciality>> getSpecialities() {
    return _specialityCollection.snapshots().map<List<Speciality>>((docs) {
      return docs.docs
          .map<Speciality>((doc) => doc.data().toEntity())
          .toList(growable: false);
    });
  }
}
