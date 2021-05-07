import 'package:equatable/equatable.dart';

import 'artist_route_details.dart';
import 'artist_route_preview.dart';
import 'location.dart';
import 'profile.dart';
import 'speciality.dart';

class ArtistEntity extends Equatable {
  const ArtistEntity({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
    required this.detailsContent,
    required this.website,
  });

  final String? id;
  final ProfileEntity profile;
  final Map<String, SpecialityEntity> specialities;
  final LocationEntity location;
  final ArtistRoutePreviewEntity previewContent;
  final ArtistRouteDetailsEntity detailsContent;
  final String website;

  @override
  List<Object?> get props => [
        id,
        profile,
        specialities,
        location,
        previewContent,
        detailsContent,
        website,
      ];

  ArtistEntity copyWith({
    ProfileEntity? profile,
    List<String>? specialities,
    LocationEntity? location,
    ArtistRoutePreviewEntity? previewContent,
    ArtistRouteDetailsEntity? detailsContent,
    String? website,
  }) {
    return ArtistEntity(
      id: id,
      profile: profile ?? this.profile,
      specialities:
          specialities as Map<String, SpecialityEntity>? ?? this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
      detailsContent: detailsContent ?? this.detailsContent,
      website: website ?? this.website,
    );
  }
}
