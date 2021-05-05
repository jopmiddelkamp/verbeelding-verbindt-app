// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeDataModel _$SizeDataModelFromJson(Map<String, dynamic> json) {
  return SizeDataModel(
    (json['width'] as num).toDouble(),
    (json['height'] as num).toDouble(),
  );
}

Map<String, dynamic> _$SizeDataModelToJson(SizeDataModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
