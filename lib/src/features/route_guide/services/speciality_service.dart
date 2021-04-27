import '../../../common/services/service_base.dart';
import '../models/speciality_model.dart';
import '../repositories/speciality/speciality_repository.dart';

abstract class SpecialityService {
  Stream<List<SpecialityModel>> getSpecialities([
    List<String>? ids,
  ]);
}

class SpecialityServiceImpl extends ServiceBase implements SpecialityService {
  const SpecialityServiceImpl({
    required final SpecialityRepository specialityRepository,
  }) : _specialityRepository = specialityRepository;

  final SpecialityRepository _specialityRepository;

  @override
  Stream<List<SpecialityModel>> getSpecialities([
    List<String>? ids,
  ]) {
    return _specialityRepository.getSpecialities(
      ids,
    );
  }
}
