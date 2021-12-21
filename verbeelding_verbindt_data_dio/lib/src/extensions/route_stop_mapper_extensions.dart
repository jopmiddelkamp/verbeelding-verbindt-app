import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension RouteStopModelX on RouteStopDataModel {
  RouteStop toEntity() {
    return RouteStop(
      artist: artist.toEntity(),
      completed: completed,
    );
  }
}

extension RouteStopModelListX on Iterable<RouteStopDataModel> {
  List<RouteStop> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<RouteStop> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension RouteStopX on RouteStop {
  RouteStopDataModel toDataModel() {
    return RouteStopDataModel(
      artist: artist.toDataModel(),
      completed: completed,
    );
  }
}

extension RouteStopListX on Iterable<RouteStop> {
  List<RouteStopDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteStopDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
