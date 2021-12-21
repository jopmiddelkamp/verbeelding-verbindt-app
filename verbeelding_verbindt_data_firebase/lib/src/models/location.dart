import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory GeolocationDataModel.fromGeoPoint(
    GeoPoint geoPoint,
  ) {
    return GeolocationDataModel(
      latitude: geoPoint.latitude,
      longitude: geoPoint.longitude,
    );
  }

  factory GeolocationDataModel.fromDynamic(
    dynamic object,
  ) {
    if (object is Map) {
      return GeolocationDataModel.fromJson(object as Map<String, dynamic>);
    } else if (object is GeoPoint) {
      return GeolocationDataModel.fromGeoPoint(object);
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

  static GeolocationDataModel fromJson(Map<String, dynamic> json) =>
      _$GeolocationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationDataModelToJson(this);
}
