// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_route_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistRouteDetailsDataModel _$ArtistRouteDetailsDataModelFromJson(
    Map<String, dynamic> json) {
  return ArtistRouteDetailsDataModel(
    videoUrl: json['videoUrl'] as String,
    text: TranslatableStringDataModel.fromJson(
        json['text'] as Map<String, dynamic>),
    images: (json['images'] as List<dynamic>)
        .map((e) => ImageDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistRouteDetailsDataModelToJson(
        ArtistRouteDetailsDataModel instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'text': instance.text.toJson(),
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
