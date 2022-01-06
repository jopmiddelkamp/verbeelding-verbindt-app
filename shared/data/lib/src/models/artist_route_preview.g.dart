// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_route_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistRoutePreviewDataModel _$ArtistRoutePreviewDataModelFromJson(
        Map<String, dynamic> json) =>
    ArtistRoutePreviewDataModel(
      text: const TranslatableStringDataModelJsonConverter()
          .fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtistRoutePreviewDataModelToJson(
        ArtistRoutePreviewDataModel instance) =>
    <String, dynamic>{
      'text': const TranslatableStringDataModelJsonConverter()
          .toJson(instance.text),
    };
