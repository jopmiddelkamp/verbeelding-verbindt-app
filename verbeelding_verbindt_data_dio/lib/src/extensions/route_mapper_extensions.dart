import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension RouteModelExtensions on RouteDataModel {
  RouteGeoLocation toGeoLocation() {
    return RouteGeoLocation(
      id: id,
      stops: stops.map((e) => e.toGeoLocation()).toList(),
    );
  }
}

extension RouteModelListExtensions on Iterable<RouteDataModel> {
  List<RouteGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<RouteGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension RouteGeoLocationExtensions on RouteGeoLocation {
  RouteDataModel toDataModel() {
    return RouteDataModel(
      id: id,
      stops: stops.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension RouteGeoLocationListExtensions on Iterable<RouteGeoLocation> {
  List<RouteDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
