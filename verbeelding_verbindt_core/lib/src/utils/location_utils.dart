import 'dart:math' show cos, sqrt, asin;

import '../../verbeelding_verbindt_core.dart';

class LocationUtils {
  // TODO: replace by the Latlng package as soon as it has up to date
  // dependencies
  static double distance(
    GeoLocation locationA,
    GeoLocation locationB,
  ) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((locationB.latitude - locationA.latitude) * p) / 2 +
        c(locationA.latitude * p) *
            c(locationB.latitude * p) *
            (1 - c((locationB.longitude - locationA.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
