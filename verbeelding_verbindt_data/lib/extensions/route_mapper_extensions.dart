import 'package:verbeelding_verbindt_core/entities/route.dart';

import '../models/route.dart';
import 'route_stop_mapper_extensions.dart';

extension RouteModelExtensions on RouteDataModel {
  RouteEntity toEntity() {
    return RouteEntity(
      id: id,
      stops: stops.map((e) => e.toEntity()).toList(),
    );
  }
}

extension RouteModelListExtensions on Iterable<RouteDataModel> {
  List<RouteEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<RouteEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension RouteEntityExtensions on RouteEntity {
  RouteDataModel toDataModel() {
    return RouteDataModel(
      id: id,
      stops: stops.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension RouteEntityListExtensions on Iterable<RouteEntity> {
  List<RouteDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
