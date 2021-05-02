import 'package:google_maps_flutter/google_maps_flutter.dart';

const kDefaultSettings = _DefaultSettings();

class _DefaultSettings {
  const _DefaultSettings();

  String get artistFallbackImagePath => 'assets/images/unknown-artist.jpg';

  CameraPosition getGoogleMapsCameraPosition(
    LatLng target,
  ) {
    return CameraPosition(
      target: target,
      zoom: 15,
      tilt: 25,
      bearing: 30,
    );
  }
}
