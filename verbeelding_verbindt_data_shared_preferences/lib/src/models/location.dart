import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class LocationDataModel extends Equatable {
  const LocationDataModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory LocationDataModel.fromDynamic(
    dynamic object,
  ) {
    if (object is Map) {
      return LocationDataModel.fromJson(object as Map<String, dynamic>);
    }
    throw Exception(
      'Unsupported source object type provided ${object.runtimeType}',
    );
  }

  @override
  String toString() =>
      '$runtimeType { latitude: $latitude, longitude: $longitude }';

  String toUrlParam() => '$latitude,$longitude';

  @override
  List<Object?> get props => [latitude, longitude];

  static LocationDataModel fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDataModelToJson(this);
}
