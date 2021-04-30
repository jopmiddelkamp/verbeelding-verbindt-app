import 'package:json_annotation/json_annotation.dart';

import 'route_stop_model.dart';

part 'route_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RouteModel {
  const RouteModel({
    required this.id,
    required this.stops,
  });

  final String? id;
  final List<RouteStopModel> stops;

  List<String?> get artistIds =>
      stops.map((e) => e.artist.id).toList(growable: false);

  List<String> get specialityIds => stops
      .expand((e) => e.artist.specialities.keys)
      .toSet()
      .toList(growable: false);

  static RouteModel fromMap(
    String id,
    Map<String, dynamic> map,
  ) =>
      RouteModel(
        id: id,
        stops: _mapStops(map['stops']),
      );

  static List<RouteStopModel> _mapStops(
    List stops,
  ) {
    return stops.map((value) {
      if (value is Map<String, dynamic>) {
        return RouteStopModel.fromMap(value);
      }
      throw Exception('$RouteModel._mapStops: unsupported value provided.');
    }).toList();
  }

  RouteModel copyWith({
    List<RouteStopModel>? stops,
  }) {
    return RouteModel(
      id: id,
      stops: stops ?? this.stops,
    );
  }

  static RouteModel fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
  Map<String, dynamic> toJson() {
    final result = _$RouteModelToJson(this);
    // Added for easy lookup on artist or speciality changed
    result['artistIds'] = artistIds;
    result['specialityIds'] = specialityIds;
    return result;
  }
}
