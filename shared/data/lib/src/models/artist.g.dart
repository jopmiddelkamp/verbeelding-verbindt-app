// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDataModel _$ArtistDataModelFromJson(Map<String, dynamic> json) =>
    ArtistDataModel(
      id: json['id'] as String?,
      profile:
          ProfileDataModel.fromJson(json['profile'] as Map<String, dynamic>),
      specialities: (json['specialities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, SpecialityDataModel.fromJson(e as Map<String, dynamic>)),
      ),
      location: GeolocationDataModel.fromJson(
          json['location'] as Map<String, dynamic>),
      previewContent: ArtistRoutePreviewDataModel.fromJson(
          json['previewContent'] as Map<String, dynamic>),
      detailsContent: ArtistRouteDetailsDataModel.fromJson(
          json['detailsContent'] as Map<String, dynamic>),
      website: json['website'] as String,
    );

Map<String, dynamic> _$ArtistDataModelToJson(ArtistDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'specialities': instance.specialities,
      'location': instance.location,
      'previewContent': instance.previewContent,
      'detailsContent': instance.detailsContent,
      'website': instance.website,
    };
