import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension SpecialityModelExtensions on SpecialityDataModel {
  SpecialityGeoLocation toGeoLocation() {
    return SpecialityGeoLocation(
      id: id,
      name: name.toGeoLocation(),
    );
  }
}

extension SpecialityModelListExtensions on Iterable<SpecialityDataModel> {
  List<SpecialityGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<SpecialityGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension SpecialityGeoLocationExtensions on SpecialityGeoLocation {
  SpecialityDataModel toDataModel() {
    return SpecialityDataModel(
      id: id,
      name: name.toDataModel(),
    );
  }
}

extension SpecialityGeoLocationListExtensions
    on Iterable<SpecialityGeoLocation> {
  List<SpecialityDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SpecialityDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
