import '../../../verbeelding_verbindt_core.dart';

class FetchUserLocationUseCase extends UseCase<LocationEntity, void> {
  FetchUserLocationUseCase({
    required LocationRepository locationRepository,
  }) : _locationRepository = locationRepository;

  final LocationRepository _locationRepository;

  @override
  Future<LocationEntity> call(
    void argument,
  ) {
    return _locationRepository.getCurrentLocation();
  }
}
