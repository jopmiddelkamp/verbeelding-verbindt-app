import '../entities/speciality.dart';
import '../repositories/speciality_repository.dart';
import '../services/service_base.dart';

// ignore: one_member_abstracts
abstract class SpecialityService {
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]);
}

class SpecialityServiceImpl extends ServiceBase implements SpecialityService {
  const SpecialityServiceImpl({
    required final SpecialityRepository specialityRepository,
  }) : _specialityRepository = specialityRepository;

  final SpecialityRepository _specialityRepository;

  @override
  Stream<List<SpecialityEntity>> getSpecialities([
    List<String>? ids,
  ]) {
    return _specialityRepository.getSpecialities(
      ids,
    );
  }
}
