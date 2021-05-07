import 'package:verbeelding_verbindt_core/entities/common/location.dart';

enum LocationAccuracy { lowest, low, medium, high, best, bestForNavigation }

abstract class LocationService {
  Future<LocationEntity> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  });
  Future<LocationEntity?> getLastKnownLocation();
}
