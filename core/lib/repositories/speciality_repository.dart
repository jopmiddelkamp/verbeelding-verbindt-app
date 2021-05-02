import '../entities/speciality.dart';

// ignore: one_member_abstracts
abstract class SpecialityRepository {
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]);
}
