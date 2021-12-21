import '../../verbeelding_verbindt_core.dart';

abstract class SpecialityRepository {
  Stream<List<Speciality>> getSpecialities();
}
