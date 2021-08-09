import 'package:geolocator/geolocator.dart' as gl;
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/repositories/location_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/repository_base.dart';

import 'extensions/position_extensions.dart';

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
