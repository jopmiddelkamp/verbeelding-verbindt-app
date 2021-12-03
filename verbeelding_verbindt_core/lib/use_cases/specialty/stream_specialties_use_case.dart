import 'dart:async';

import '../../entities/speciality.dart';
import '../../repositories/speciality_repository.dart';
import '../use_case_base.dart';

class StreamSpecialitiesUseCase
    extends UseCase<Stream<List<SpecialityEntity>>, void> {
  StreamSpecialitiesUseCase({
    required SpecialityRepository specialtyRepository,
  }) : _specialtyRepository = specialtyRepository;

  final SpecialityRepository _specialtyRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and OpenRouteUseCaseFailure union
  @override
  Future<Stream<List<SpecialityEntity>>> call(
    void argument,
  ) async {
    return _specialtyRepository.getSpecialities();
  }
}
