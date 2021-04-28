import 'package:geolocator/geolocator.dart';

import '../../../models/location_model.dart';
import '../../service_base.dart';
import '../location_service.dart';
import 'extensions/position_extensions.dart';

class GlLocationServiceImpl extends ServiceBase implements LocationService {
  @override
  Future<LocationModel> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return position.toLocationModel();
  }

  @override
  Future<LocationModel?> getLastKnownLocation() async {
    final lastPostion = await Geolocator.getLastKnownPosition();
    if (lastPostion == null) {
      return null;
    }
    return lastPostion.toLocationModel();
  }

  @override
  double distanceBetween(
    LocationModel locationA,
    LocationModel locationB,
  ) {
    return Geolocator.distanceBetween(
      locationA.latitude,
      locationA.longitude,
      locationB.latitude,
      locationB.longitude,
    );
  }
}
