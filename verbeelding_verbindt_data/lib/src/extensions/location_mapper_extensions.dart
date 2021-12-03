import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension LocationModelExtensions on LocationDataModel {
  LocationEntity toEntity() {
    return LocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension LocationModelListExtensions on Iterable<LocationDataModel> {
  List<LocationEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<LocationEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension LocationEntityExtensions on LocationEntity {
  LocationDataModel toDataModel() {
    return LocationDataModel(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension LocationEntityListExtensions on Iterable<LocationEntity> {
  List<LocationDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<LocationDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
