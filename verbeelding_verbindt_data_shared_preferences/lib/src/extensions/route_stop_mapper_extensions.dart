import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension RouteStopModelExtensions on RouteStopDataModel {
  RouteStopGeoLocation toGeoLocation() {
    return RouteStopGeoLocation(
      artist: artist.toGeoLocation(),
      completed: completed,
    );
  }
}

extension RouteStopModelListExtensions on Iterable<RouteStopDataModel> {
  List<RouteStopGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<RouteStopGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension RouteStopGeoLocationExtensions on RouteStopGeoLocation {
  RouteStopDataModel toDataModel() {
    return RouteStopDataModel(
      artist: artist.toDataModel(),
      completed: completed,
    );
  }
}

extension RouteStopGeoLocationListExtensions on Iterable<RouteStopGeoLocation> {
  List<RouteStopDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteStopDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
