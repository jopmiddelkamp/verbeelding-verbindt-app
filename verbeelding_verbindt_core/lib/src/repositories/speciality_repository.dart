import '../../verbeelding_verbindt_core.dart';

abstract class SpecialityRepository extends RepositoryBase {
  Stream<List<SpecialityEntity>> getSpecialities();
}
