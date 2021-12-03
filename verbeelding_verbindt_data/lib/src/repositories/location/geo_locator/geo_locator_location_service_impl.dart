import 'package:geolocator/geolocator.dart' as gl;
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_data.dart';

class GlLocationRepositoryImpl extends RepositoryBase
    implements LocationRepository {
  @override
  Future<LocationEntity> getCurrentLocation({
    LocationAccuracy locationAccuracy = LocationAccuracy.best,
  }) async {
    final position = await gl.Geolocator.getCurrentPosition(
      desiredAccuracy: accuracyMap[locationAccuracy]!,
    );
    return position.toLocationModel();
  }

  @override
  Future<LocationEntity?> getLastKnownLocation() async {
    final lastPosition = await gl.Geolocator.getLastKnownPosition();
    if (lastPosition == null) {
      return await getCurrentLocation();
    }
    return lastPosition.toLocationModel();
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
