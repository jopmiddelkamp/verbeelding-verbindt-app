import 'package:verbeelding_verbindt_core/entities/route_stop.dart';

import '../models/route_stop.dart';
import 'artist_mapper_extension.dart';

extension RouteStopModelExtensions on RouteStopDataModel {
  RouteStopEntity toEntity() {
    return RouteStopEntity(
      artist: artist.toEntity(),
      completed: completed,
    );
  }
}

extension RouteStopModelListExtensions on Iterable<RouteStopDataModel> {
  List<RouteStopEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<RouteStopEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension RouteStopEntityExtensions on RouteStopEntity {
  RouteStopDataModel toDataModel() {
    return RouteStopDataModel(
      artist: artist.toDataModel(),
      completed: completed,
    );
  }
}

extension RouteStopEntityListExtensions on Iterable<RouteStopEntity> {
  List<RouteStopDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteStopDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
