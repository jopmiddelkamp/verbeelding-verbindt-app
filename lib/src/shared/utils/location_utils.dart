import 'package:geolocator/geolocator.dart';

import '../domain/models/location_model.dart';

class LocationUtils {
  static double distanceBetween(
    LocationModel locationA,
    LocationModel locationB,
  ) {
    return Geolocator.distanceBetween(
      locationA.latitude,
      locationA.longitude,
      locationB.latitude,
      locationB.longitude,
    );
  }
}
