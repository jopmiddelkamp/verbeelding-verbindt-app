import 'package:geolocator/geolocator.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_ui.dart';

abstract class LocationService {
  Future<GeoLocation> getCurrentLocation({
    LocationAccuracy? desiredAccuracy,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  });
  Future<GeoLocation> getLastKnownLocation({
    bool forceAndroidLocationManager = false,
  });
}

class LocationServiceImpl extends ServiceBase implements LocationService {
  @override
  Future<GeoLocation> getCurrentLocation({
    LocationAccuracy? desiredAccuracy,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async {
    final result = await Geolocator.getCurrentPosition(
      desiredAccuracy: desiredAccuracy ?? LocationAccuracy.best,
      forceAndroidLocationManager: forceAndroidLocationManager,
      timeLimit: timeLimit,
    );
    return result.toGeoLocation();
  }

  @override
  Future<GeoLocation> getLastKnownLocation({
    bool forceAndroidLocationManager = false,
  }) async {
    final lastPosition = await Geolocator.getLastKnownPosition(
      forceAndroidLocationManager: forceAndroidLocationManager,
    );
    if (lastPosition == null) {
      return await getCurrentLocation();
    }
    return lastPosition.toGeoLocation();
  }
}
