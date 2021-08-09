import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';

extension PositionExtensions on Position {
  LocationEntity toLocationModel() {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
