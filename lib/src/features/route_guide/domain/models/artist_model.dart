import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/domain/models/location_model.dart';
import 'artist_route_preview_model.dart';
import 'profile_model.dart';
import 'speciality_model.dart';

part 'artist_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ArtistModel extends Equatable {
  const ArtistModel({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
  });

  final String? id;
  final ProfileModel profile;
  final Map<String, SpecialityModel> specialities;
  final LocationModel location;
  final ArtistRoutePreviewModel previewContent;

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

  static ArtistModel fromMap({
    String? id,
    required Map<String, dynamic> map,
  }) {
    final specialities = <String, SpecialityModel>{};
    (map['specialities'] as Map).forEach((key, value) {
      final specialityMap = value as Map;
      final speciality = SpecialityModel.fromMap(
        key,
        specialityMap as Map<String, dynamic>,
      );
      specialities[key] = speciality;
    });
    return ArtistModel(
      id: id,
      profile: ProfileModel.fromJson(
        map['profile'],
      ),
      specialities: specialities,
      location: LocationModel.fromDynamic(
        map['location'],
      ),
      previewContent: ArtistRoutePreviewModel.fromJson(
        map['previewContent'],
      ),
    );
  }

  ArtistModel copyWith({
    ProfileModel? profile,
    List<String>? specialities,
    LocationModel? location,
    ArtistRoutePreviewModel? routePreviewContent,
  }) {
    return ArtistModel(
      id: id,
      profile: profile ?? this.profile,
      specialities:
          specialities as Map<String, SpecialityModel>? ?? this.specialities,
      location: location ?? this.location,
      previewContent: routePreviewContent ?? this.previewContent,
    );
  }

  static ArtistModel fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
