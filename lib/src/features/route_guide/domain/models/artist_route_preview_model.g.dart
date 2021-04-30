// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_route_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistRoutePreviewModel _$ArtistRoutePreviewModelFromJson(
    Map<String, dynamic> json) {
  return ArtistRoutePreviewModel(
    text: json['text'] as String,
    images: (json['images'] as List<dynamic>)
        .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistRoutePreviewModelToJson(
        ArtistRoutePreviewModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
