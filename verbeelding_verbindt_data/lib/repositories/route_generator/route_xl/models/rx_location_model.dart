import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rx_location_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RxLocationModel extends Equatable {
  const RxLocationModel({
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
  factory RxLocationModel.fromJson(Map<String, dynamic> json) =>
      _$RxLocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$RxLocationModelToJson(this);
}
