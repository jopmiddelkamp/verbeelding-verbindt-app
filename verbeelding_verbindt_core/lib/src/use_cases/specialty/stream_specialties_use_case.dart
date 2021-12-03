import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

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
