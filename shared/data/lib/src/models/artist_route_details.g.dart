// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_route_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistRouteDetailsDataModel _$ArtistRouteDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    ArtistRouteDetailsDataModel(
      video:
          YoutubeVideoDataModel.fromJson(json['video'] as Map<String, dynamic>),
      text: const TranslatableStringDataModelJsonConverter()
          .fromJson(json['text'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistRouteDetailsDataModelToJson(
        ArtistRouteDetailsDataModel instance) =>
    <String, dynamic>{
      'video': instance.video,
      'text': const TranslatableStringDataModelJsonConverter()
          .toJson(instance.text),
      'images': instance.images,
    };
