import 'package:cloud_firestore/cloud_firestore.dart';

import '../../verbeelding_verbindt_data.dart';

extension GeoPointExtensions on GeoPoint {
  LocationDataModel toLocation() {
    return LocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
