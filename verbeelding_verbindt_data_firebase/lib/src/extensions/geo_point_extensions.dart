import 'package:cloud_firestore/cloud_firestore.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension GeoPointX on GeoPoint {
  GeolocationDataModel toLocation() {
    return GeolocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
