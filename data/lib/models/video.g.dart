// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDataModel _$VideoDataModelFromJson(Map<String, dynamic> json) {
  return VideoDataModel(
    aspectRatio: (json['aspectRatio'] as num).toDouble(),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$VideoDataModelToJson(VideoDataModel instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'url': instance.url,
    };
