import '../../entities/common/location.dart';
import '../../repositories/location_repository.dart';
import '../use_case_base.dart';

class FetchUserLocationUseCase extends UseCase<LocationEntity> {
  FetchUserLocationUseCase({
    required LocationRepository locationRepository,
  }) : _locationRepository = locationRepository;

  final LocationRepository _locationRepository;

  @override
  Future<LocationEntity> handle() {
    return _locationRepository.getCurrentLocation();
  }
}
