import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension PositionExtensions on Position {
  GeoLocation toGeoLocation() {
    return GeoLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
