import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_step_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RouteStepModel extends Equatable {
  const RouteStepModel({
    required this.name,
    required this.arrival,
    required this.distance,
  });

  final String name;
  final int arrival;
  final double distance;

  @override
  String toString() =>
      '$runtimeType { name: $name, arrival: $arrival, distance: $distance }';

  @override
  List<Object?> get props => [
        name,
        arrival,
        distance,
      ];

  // ignore: sort_constructors_first
  factory RouteStepModel.fromJson(Map<String, dynamic> json) =>
      _$RouteStepModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStepModelToJson(this);
}
