import '../../models/location_model.dart';

enum LocationAccuracy { lowest, low, medium, high, best, bestForNavigation }

abstract class LocationService {
  Future<LocationModel> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  });
  Future<LocationModel?> getLastKnownLocation();
  double distanceBetween(
    LocationModel locationA,
    LocationModel locationB,
  );
}
