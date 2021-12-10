import 'package:cloud_firestore/cloud_firestore.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension GeoPointExtensions on GeoPoint {
  LocationDataModel toLocation() {
    return LocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
