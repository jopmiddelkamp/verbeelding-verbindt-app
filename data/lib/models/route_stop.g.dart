// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteStopDataModel _$RouteStopDataModelFromJson(Map<String, dynamic> json) {
  return RouteStopDataModel(
    artist: ArtistDataModel.fromJson(json['artist'] as Map<String, dynamic>),
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$RouteStopDataModelToJson(RouteStopDataModel instance) =>
    <String, dynamic>{
      'artist': instance.artist.toJson(),
      'completed': instance.completed,
    };
