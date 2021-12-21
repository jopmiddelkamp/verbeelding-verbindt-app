import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension PositionX on Position {
  Geolocation toEntity() {
    return Geolocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
