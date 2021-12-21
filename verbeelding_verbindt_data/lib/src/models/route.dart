import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

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

  RouteDataModel copyWith({
    String? id,
    List<RouteStopDataModel>? stops,
  }) {
    return RouteDataModel(
      id: id ?? this.id,
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
