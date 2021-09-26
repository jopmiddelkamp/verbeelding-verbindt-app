import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/location.dart';

extension GeoPointExtensions on GeoPoint {
  LocationDataModel toLocation() {
    return LocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
