// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataModel _$ImageDataModelFromJson(Map<String, dynamic> json) =>
    ImageDataModel(
      blurhash: json['blurhash'] as String,
      url: json['url'] as String,
      size: SizeDataModel.fromJson(json['size'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDataModelToJson(ImageDataModel instance) =>
    <String, dynamic>{
      'blurhash': instance.blurhash,
      'url': instance.url,
      'size': instance.size,
    };
