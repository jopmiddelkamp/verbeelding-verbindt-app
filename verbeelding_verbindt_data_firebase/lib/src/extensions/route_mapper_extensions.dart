import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension RouteModelX on RouteDataModel {
  Route toEntity() {
    return Route(
      id: id,
      stops: stops.map((e) => e.toEntity()).toList(),
    );
  }
}

extension RouteModelListX on Iterable<RouteDataModel> {
  List<Route> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Route> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension RouteX on Route {
  RouteDataModel toDataModel() {
    return RouteDataModel(
      id: id,
      stops: stops.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension RouteListX on Iterable<Route> {
  List<RouteDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
