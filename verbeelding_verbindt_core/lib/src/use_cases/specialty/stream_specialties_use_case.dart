import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamSpecialitiesUseCase
    extends UseCase<Stream<List<Speciality>>, void> {
  StreamSpecialitiesUseCase({
    required SpecialityRepository specialtyRepository,
  }) : _specialtyRepository = specialtyRepository;

  final SpecialityRepository _specialtyRepository;

  // TODO: rewrite with Either with non nullable Route and OpenRouteUseCaseFailure union
  @override
  Stream<List<Speciality>> call(void params) {
    return _specialtyRepository.getSpecialities();
  }
}
