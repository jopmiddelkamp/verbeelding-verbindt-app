// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoDataModel _$YoutubeVideoDataModelFromJson(
        Map<String, dynamic> json) =>
    YoutubeVideoDataModel(
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      videoId: json['videoId'] as String,
    );

Map<String, dynamic> _$YoutubeVideoDataModelToJson(
        YoutubeVideoDataModel instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'videoId': instance.videoId,
    };
