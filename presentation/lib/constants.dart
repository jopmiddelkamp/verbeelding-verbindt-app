import 'package:google_maps_flutter/google_maps_flutter.dart';

class Package {
  const Package._();
  static const name = 'verbeelding_verbindt_presentation';
  static const assets = _Assets();
  static const settings = _Settings();
}

class _Assets {
  const _Assets();
  final String introHeader = 'assets/images/intro-header.jpg';
  final String unknownArtist = 'assets/images/unknown-artist.jpg';
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
