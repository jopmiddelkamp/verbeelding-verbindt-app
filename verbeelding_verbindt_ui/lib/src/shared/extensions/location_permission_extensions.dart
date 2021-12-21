import 'package:geolocator/geolocator.dart';

extension LocationPermissionX on LocationPermission {
  bool get isDenied => this == LocationPermission.denied;

  bool get isDeniedForever => this == LocationPermission.deniedForever;

  bool get isWhileInUse => this == LocationPermission.whileInUse;

  bool get isAlways => this == LocationPermission.always;
}
