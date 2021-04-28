import '../../models/location_model.dart';

abstract class LocationService {
  Future<LocationModel> getCurrentLocation();
  Future<LocationModel?> getLastKnownLocation();
  double distanceBetween(
    LocationModel locationA,
    LocationModel locationB,
  );
}
