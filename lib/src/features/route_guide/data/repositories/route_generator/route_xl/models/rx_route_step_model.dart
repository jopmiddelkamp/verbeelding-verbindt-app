import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rx_route_step_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RxRouteStepModel extends Equatable {
  const RxRouteStepModel({
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
  List<Object> get props => [
        name,
        arrival,
        distance,
      ];

  // ignore: sort_constructors_first
  factory RxRouteStepModel.fromJson(Map<String, dynamic> json) =>
      _$RxRouteStepModelFromJson(json);
  Map<String, dynamic> toJson() => _$RxRouteStepModelToJson(this);
}
