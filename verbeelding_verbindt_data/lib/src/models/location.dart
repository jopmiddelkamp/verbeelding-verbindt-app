import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class GeolocationDataModel extends Equatable {
  const GeolocationDataModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  String toString() =>
      '$runtimeType { latitude: $latitude, longitude: $longitude }';

  String toUrlParam() => '$latitude,$longitude';

  @override
  List<Object?> get props => [latitude, longitude];

  static GeolocationDataModel fromJson(Map<String, dynamic> json) =>
      _$GeolocationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationDataModelToJson(this);
}
