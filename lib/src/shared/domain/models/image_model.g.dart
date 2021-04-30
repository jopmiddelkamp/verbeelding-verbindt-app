// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    blurhash: json['blurhash'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'blurhash': instance.blurhash,
      'url': instance.url,
    };
