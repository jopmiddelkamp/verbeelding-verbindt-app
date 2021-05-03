import '../entities/speciality.dart';

abstract class SpecialityRepository {
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]);
}
