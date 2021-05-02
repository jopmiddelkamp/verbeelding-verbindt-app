import 'package:json_annotation/json_annotation.dart';

import 'route_stop.dart';

part 'route.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RouteDataModel {
  const RouteDataModel({
    required this.id,
    required this.stops,
  });

  final String? id;
  final List<RouteStopDataModel> stops;

  List<String?> get artistIds =>
      stops.map((e) => e.artist.id).toList(growable: false);

  List<String> get specialityIds => stops
      .expand((e) => e.artist.specialities.keys)
      .toSet()
      .toList(growable: false);

  static RouteDataModel fromFirebaseMap(
    String id,
    Map<String, dynamic> map,
  ) =>
      RouteDataModel(
        id: id,
        stops: _mapStops(map['stops']),
      );

  static List<RouteStopDataModel> _mapStops(
    List stops,
  ) {
    return stops.map((value) {
      if (value is Map<String, dynamic>) {
        return RouteStopDataModel.fromFirebaseMap(value);
      }
      throw Exception('$RouteDataModel._mapStops: unsupported value provided.');
    }).toList();
  }

  RouteDataModel copyWith({
    List<RouteStopDataModel>? stops,
  }) {
    return RouteDataModel(
      id: id,
      stops: stops ?? this.stops,
    );
  }

  static RouteDataModel fromJson(Map<String, dynamic> json) =>
      _$RouteDataModelFromJson(json);
  Map<String, dynamic> toJson() {
    final result = _$RouteDataModelToJson(this);
    // Added for easy lookup on artist or speciality changed
    result['artistIds'] = artistIds;
    result['specialityIds'] = specialityIds;
    return result;
  }
}
