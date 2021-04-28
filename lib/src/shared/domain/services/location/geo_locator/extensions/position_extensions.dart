import 'package:geolocator/geolocator.dart';

import '../../../../models/location_model.dart';

extension PositionExtensions on Position {
  LocationModel toLocationModel() {
    return LocationModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
