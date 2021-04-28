import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../location_model.dart';

extension LocationModelExtensions on LocationModel {
  LatLng toLatLng() {
    return LatLng(
      latitude,
      longitude,
    );
  }
}
