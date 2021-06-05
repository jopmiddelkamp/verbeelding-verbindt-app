import 'package:geolocator/geolocator.dart' as gl;
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/services/location_service.dart';
import 'package:verbeelding_verbindt_core/services/service_base.dart';

import 'extensions/position_extensions.dart';

class GlLocationServiceImpl extends ServiceBase implements LocationService {
  @override
  Future<LocationEntity> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  }) async {
    // // TODO: remove when Geo Locattor is working again
    // return LocationEntity(latitude: 52.393309, longitude: 6.1430403);
    final position = await gl.Geolocator.getCurrentPosition(
      desiredAccuracy: accuracyMap[locationAccuracy]!,
    );
    return position.toLocationModel();
  }

  @override
  Future<LocationEntity?> getLastKnownLocation() async {
    // // TODO: remove when Geo Locattor is working again
    // return LocationEntity(latitude: 52.393309, longitude: 6.1430403);
    final lastPostion = await gl.Geolocator.getLastKnownPosition();
    if (lastPostion == null) {
      return await getCurrentLocation();
    }
    return lastPostion.toLocationModel();
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
