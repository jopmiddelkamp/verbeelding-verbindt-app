import '../../entities/common/location.dart';
import '../../repositories/location_repository.dart';
import '../use_case_base.dart';

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
