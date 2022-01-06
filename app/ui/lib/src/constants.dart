import 'package:google_maps_flutter/google_maps_flutter.dart';

class Package {
  const Package._();
  static const name = 'verbeelding_verbindt_ui';
  static const settings = _Settings();
}

class _Settings {
  const _Settings();
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
