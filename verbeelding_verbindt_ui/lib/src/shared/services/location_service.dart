import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_ui.dart';

abstract class LocationService {
  Future<Geolocation> getCurrentLocation({
    LocationAccuracy? desiredAccuracy,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  });
  Future<Geolocation> getLastKnownLocation({
    bool forceAndroidLocationManager = false,
  });
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<LocationPermission> requestPermissionIfNeeded();
}

class LocationServiceImpl extends ServiceBase implements LocationService {
  @override
  Future<LocationPermission> checkPermission() {
    return Geolocator.checkPermission();
  }

  @override
  Future<LocationPermission> requestPermission() {
    return Geolocator.requestPermission();
  }

  @override
  Future<LocationPermission> requestPermissionIfNeeded() async {
    var permission = await checkPermission();
    var whileInUse = permission == LocationPermission.whileInUse;
    var always = permission == LocationPermission.always;
    if (whileInUse || always) {
      return permission;
    }
    return await requestPermission();
  }

  @override
  Future<Geolocation> getCurrentLocation({
    LocationAccuracy? desiredAccuracy,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async {
    final result = await Geolocator.getCurrentPosition(
      desiredAccuracy: desiredAccuracy ?? LocationAccuracy.best,
      forceAndroidLocationManager: forceAndroidLocationManager,
      timeLimit: timeLimit,
    );
    return result.toEntity();
  }

  @override
  Future<Geolocation> getLastKnownLocation({
    bool forceAndroidLocationManager = false,
  }) async {
    final lastPosition = await Geolocator.getLastKnownPosition(
      forceAndroidLocationManager: forceAndroidLocationManager,
    );
    if (lastPosition == null) {
      return await getCurrentLocation();
    }
    return lastPosition.toEntity();
  }
}
