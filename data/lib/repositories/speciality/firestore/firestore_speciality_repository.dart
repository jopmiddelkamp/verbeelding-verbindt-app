import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/speciality.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';

import '../../../extensions/speciality_mapper_extensions.dart';
import '../../../models/speciality.dart';

class FirestoreSpecialityRepository implements SpecialityRepository {
  FirestoreSpecialityRepository()
      : _specialityCollection =
            FirebaseFirestore.instance.collection('specialities');

  final CollectionReference _specialityCollection;

  @override
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]) {
    // ignore: unnecessary_cast
    var query = _specialityCollection as Query;
    if (ids != null) {
      query = query.where('id', whereIn: ids);
    }
    return query.snapshots().map((docs) {
      return docs.docs
          .map((doc) => SpecialityDataModel.fromMap(
                doc.id,
                doc.data(),
              ).toEntity())
          .toList(growable: false);
    });
  }
}
