import '../entities/common/speciality.dart';
import 'repository_base.dart';

abstract class SpecialityRepository extends RepositoryBase {
  Stream<List<SpecialityEntity>> getSpecialities();
}
