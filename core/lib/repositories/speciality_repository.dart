import '../entities/common/speciality.dart';

abstract class SpecialityRepository {
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]);
}
