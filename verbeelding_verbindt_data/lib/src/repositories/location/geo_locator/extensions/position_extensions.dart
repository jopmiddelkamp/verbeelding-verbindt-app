import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension PositionExtensions on Position {
  LocationEntity toLocationModel() {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
