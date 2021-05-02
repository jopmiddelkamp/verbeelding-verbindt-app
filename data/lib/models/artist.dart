import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/location.dart';
import 'artist_route_preview.dart';
import 'profile.dart';
import 'speciality.dart';

part 'artist.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ArtistDataModel extends Equatable {
  const ArtistDataModel({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
  });

  final String? id;
  final ProfileDataModel profile;
  final Map<String, SpecialityDataModel> specialities;
  final LocationDataModel location;
  final ArtistRoutePreviewDataModel previewContent;

  @override
  List<Object?> get props => [
        id,
        profile,
        specialities,
        location,
        previewContent,
      ];

  @override
  String toString() => '''$runtimeType { 
                            id: $id,
                            profile: $profile,
                            specialities: $specialities,
                            location: $location,
                            previewContent: $previewContent,
                          }''';

  static ArtistDataModel fromFirebaseMap({
    String? id,
    required Map<String, dynamic> map,
  }) {
    final specialities = <String, SpecialityDataModel>{};
    (map['specialities'] as Map).forEach((key, value) {
      final specialityMap = value as Map;
      final speciality = SpecialityDataModel.fromFirebaseMap(
        key,
        specialityMap as Map<String, dynamic>,
      );
      specialities[key] = speciality;
    });
    return ArtistDataModel(
      id: id,
      profile: ProfileDataModel.fromJson(
        map['profile'],
      ),
      specialities: specialities,
      location: LocationDataModel.fromDynamic(
        map['location'],
      ),
      previewContent: ArtistRoutePreviewDataModel.fromJson(
        map['previewContent'],
      ),
    );
  }

  ArtistDataModel copyWith({
    ProfileDataModel? profile,
    List<String>? specialities,
    LocationDataModel? location,
    ArtistRoutePreviewDataModel? previewContent,
  }) {
    return ArtistDataModel(
      id: id,
      profile: profile ?? this.profile,
      specialities: specialities as Map<String, SpecialityDataModel>? ??
          this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
    );
  }

  static ArtistDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistDataModelToJson(this);
}
