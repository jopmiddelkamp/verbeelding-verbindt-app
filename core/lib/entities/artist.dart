import 'package:equatable/equatable.dart';

import '../entities/location.dart';
import 'artist_route_preview.dart';
import 'profile.dart';
import 'speciality.dart';

class ArtistEntity extends Equatable {
  const ArtistEntity({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
  });

  final String? id;
  final ProfileEntity profile;
  final Map<String, SpecialityEntity> specialities;
  final LocationEntity location;
  final ArtistRoutePreviewEntity previewContent;

  @override
  List<Object?> get props => [
        id,
        profile,
        specialities,
        location,
        previewContent,
      ];

  ArtistEntity copyWith({
    ProfileEntity? profile,
    List<String>? specialities,
    LocationEntity? location,
    ArtistRoutePreviewEntity? previewContent,
  }) {
    return ArtistEntity(
      id: id,
      profile: profile ?? this.profile,
      specialities:
          specialities as Map<String, SpecialityEntity>? ?? this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
    );
  }
}
