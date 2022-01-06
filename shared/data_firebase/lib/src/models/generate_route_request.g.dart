// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_route_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateRouteRequestDataModel _$GenerateRouteRequestDataModelFromJson(
        Map<String, dynamic> json) =>
    GenerateRouteRequestDataModel(
      artistIds:
          (json['artistIds'] as List<dynamic>).map((e) => e as String).toSet(),
      userLocation: GeolocationDataModel.fromJson(
          json['userLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerateRouteRequestDataModelToJson(
        GenerateRouteRequestDataModel instance) =>
    <String, dynamic>{
      'artistIds': instance.artistIds.toList(),
      'userLocation': instance.userLocation,
    };
