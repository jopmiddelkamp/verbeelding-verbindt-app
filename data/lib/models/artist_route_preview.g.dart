// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_route_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistRoutePreviewDataModel _$ArtistRoutePreviewDataModelFromJson(
    Map<String, dynamic> json) {
  return ArtistRoutePreviewDataModel(
    text: TranslatableStringDataModel.fromJson(
        json['text'] as Map<String, dynamic>),
    images: (json['images'] as List<dynamic>)
        .map((e) => ImageDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistRoutePreviewDataModelToJson(
        ArtistRoutePreviewDataModel instance) =>
    <String, dynamic>{
      'text': instance.text.toJson(),
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
