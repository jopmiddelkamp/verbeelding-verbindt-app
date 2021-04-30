import '../../../domain/models/speciality_model.dart';

// ignore: one_member_abstracts
abstract class SpecialityRepository {
  Stream<List<SpecialityModel>> getSpecialities([List<String>? ids]);
}
