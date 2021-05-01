import 'package:geolocator/geolocator.dart' as gl;

import '../../../models/location_model.dart';
import '../../service_base.dart';
import '../location_service.dart';
import 'extensions/position_extensions.dart';

class GlLocationServiceImpl extends ServiceBase implements LocationService {
  @override
  Future<LocationModel> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  }) async {
    final position = await gl.Geolocator.getCurrentPosition(
      desiredAccuracy: accuracyMap[locationAccuracy]!,
    );
    return position.toLocationModel();
  }

  @override
  Future<LocationModel?> getLastKnownLocation() async {
    final lastPostion = await gl.Geolocator.getLastKnownPosition();
    if (lastPostion == null) {
      return await getCurrentLocation();
    }
    return lastPostion.toLocationModel();
  }

  @override
  double distanceBetween(
    LocationModel locationA,
    LocationModel locationB,
  ) {
    return gl.Geolocator.distanceBetween(
      locationA.latitude,
      locationA.longitude,
      locationB.latitude,
      locationB.longitude,
    );
  }

  Map<LocationAccuracy, gl.LocationAccuracy> accuracyMap = {
    LocationAccuracy.lowest: gl.LocationAccuracy.lowest,
    LocationAccuracy.low: gl.LocationAccuracy.low,
    LocationAccuracy.medium: gl.LocationAccuracy.medium,
    LocationAccuracy.high: gl.LocationAccuracy.high,
    LocationAccuracy.best: gl.LocationAccuracy.best,
    LocationAccuracy.bestForNavigation: gl.LocationAccuracy.bestForNavigation,
  };
}
