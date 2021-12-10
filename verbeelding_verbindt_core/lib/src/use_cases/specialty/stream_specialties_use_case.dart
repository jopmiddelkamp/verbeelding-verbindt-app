import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamSpecialitiesUseCase
    extends UseCase<Stream<List<SpecialityGeoLocation>>, void> {
  StreamSpecialitiesUseCase({
    required SpecialityRepository specialtyRepository,
  }) : _specialtyRepository = specialtyRepository;

  final SpecialityRepository _specialtyRepository;

  // TODO: rewrite with Either with non nullable RouteGeoLocation and OpenRouteUseCaseFailure union
  @override
  Future<Stream<List<SpecialityGeoLocation>>> call(
    void argument,
  ) async {
    return _specialtyRepository.getSpecialities();
  }
}
