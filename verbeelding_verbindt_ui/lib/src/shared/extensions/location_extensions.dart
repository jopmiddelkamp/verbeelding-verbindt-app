import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension LocationEntityExtensions on LocationEntity {
  LatLng toLatLng() {
    return LatLng(
      latitude,
      longitude,
    );
  }
}
