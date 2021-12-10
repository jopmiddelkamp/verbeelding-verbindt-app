import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension SizeDataModelExtensions on SizeDataModel {
  SizeGeoLocation toGeoLocation() {
    return SizeGeoLocation(
      width,
      height,
    );
  }
}

extension SizeDataModelListExtensions on Iterable<SizeDataModel> {
  List<SizeGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<SizeGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension SizeGeoLocationExtensions on SizeGeoLocation {
  SizeDataModel toDataModel() {
    return SizeDataModel(
      width,
      height,
    );
  }
}

extension SizeGeoLocationListExtensions on Iterable<SizeGeoLocation> {
  List<SizeDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SizeDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
