import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class LocationModel extends Equatable {
  const LocationModel({
    required this.name,
    required this.lat,
    required this.lng,
  });

  final String name;
  final double lat;
  final double lng;

  @override
  String toString() => '$runtimeType { name: $name, lat: $lat, lng: $lng }';

  @override
  List<Object?> get props => [
        name,
        lat,
        lng,
      ];

  // ignore: sort_constructors_first
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
