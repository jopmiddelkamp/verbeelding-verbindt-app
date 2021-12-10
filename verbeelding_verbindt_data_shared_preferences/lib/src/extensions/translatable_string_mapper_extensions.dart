import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension TranslatableStringModelExtensions on TranslatableStringDataModel {
  TranslatableStringGeoLocation toGeoLocation() {
    return TranslatableStringGeoLocation(data);
  }
}

extension TranslatableStringModelListExtensions
    on Iterable<TranslatableStringDataModel> {
  List<TranslatableStringGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<TranslatableStringGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension TranslatableStringGeoLocationExtensions
    on TranslatableStringGeoLocation {
  TranslatableStringDataModel toDataModel() {
    return TranslatableStringDataModel(data);
  }
}

extension TranslatableStringGeoLocationListExtensions
    on Iterable<TranslatableStringGeoLocation> {
  List<TranslatableStringDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<TranslatableStringDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
