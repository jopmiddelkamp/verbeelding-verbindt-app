import '../entities/common/location.dart';

enum LocationAccuracy { lowest, low, medium, high, best, bestForNavigation }

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  });
  Future<LocationEntity?> getLastKnownLocation();
}
