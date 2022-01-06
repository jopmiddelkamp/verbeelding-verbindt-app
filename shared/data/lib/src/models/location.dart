import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class GeolocationDataModel extends Equatable {
  const GeolocationDataModel({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  String toUrlParam() => '$latitude,$longitude';

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [latitude, longitude];

  static GeolocationDataModel fromJson(Map<String, dynamic> json) =>
      _$GeolocationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationDataModelToJson(this);
}
