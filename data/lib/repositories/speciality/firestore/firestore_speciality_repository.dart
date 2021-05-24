import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';

import '../../../extensions/speciality_mapper_extensions.dart';
import '../../../models/speciality.dart';

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
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]) {
    // ignore: unnecessary_cast
    var query = _specialityCollection as Query<SpecialityDataModel>;
    if (ids != null) {
      query = query.where('id', whereIn: ids);
    }
    return query.snapshots().map<List<SpecialityEntity>>((docs) {
      return docs.docs
          .map<SpecialityEntity>((doc) => doc.data().toEntity())
          .toList(growable: false);
    });
  }
}
