import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension LocationModelExtensions on LocationDataModel {
  GeoLocation toGeoLocation() {
    return GeoLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension LocationModelListExtensions on Iterable<LocationDataModel> {
  List<GeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<GeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension GeoLocationExtensions on GeoLocation {
  LocationDataModel toDataModel() {
    return LocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension GeoLocationListExtensions on Iterable<GeoLocation> {
  List<LocationDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<LocationDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
