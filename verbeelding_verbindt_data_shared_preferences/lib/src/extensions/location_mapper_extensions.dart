import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension LocationModelX on GeolocationDataModel {
  Geolocation toEntity() {
    return Geolocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension GeolocationDataModelLisX on Iterable<GeolocationDataModel> {
  List<Geolocation> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Geolocation> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension GeolocationX on Geolocation {
  GeolocationDataModel toDataModel() {
    return GeolocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension GeolocationListX on Iterable<Geolocation> {
  List<GeolocationDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<GeolocationDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
