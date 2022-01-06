// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDataModel _$RouteDataModelFromJson(Map<String, dynamic> json) =>
    RouteDataModel(
      id: json['id'] as String?,
      stops: (json['stops'] as List<dynamic>)
          .map((e) => RouteStopDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteDataModelToJson(RouteDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stops': instance.stops,
    };
