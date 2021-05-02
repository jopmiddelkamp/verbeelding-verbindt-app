// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDataModel _$ArtistDataModelFromJson(Map<String, dynamic> json) {
  return ArtistDataModel(
    id: json['id'] as String?,
    profile: ProfileDataModel.fromJson(json['profile'] as Map<String, dynamic>),
    specialities: (json['specialities'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, SpecialityDataModel.fromJson(e as Map<String, dynamic>)),
    ),
    location:
        LocationDataModel.fromJson(json['location'] as Map<String, dynamic>),
    previewContent: ArtistRoutePreviewDataModel.fromJson(
        json['previewContent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArtistDataModelToJson(ArtistDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile.toJson(),
      'specialities':
          instance.specialities.map((k, e) => MapEntry(k, e.toJson())),
      'location': instance.location.toJson(),
      'previewContent': instance.previewContent.toJson(),
    };
