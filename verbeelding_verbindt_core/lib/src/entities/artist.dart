import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistGeoLocation extends Equatable {
  const ArtistGeoLocation({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
    required this.detailsContent,
    required this.website,
  });

  final String? id;
  final ProfileGeoLocation profile;
  final Map<String, SpecialityGeoLocation> specialities;
  final GeoLocation location;
  final ArtistRoutePreviewGeoLocation previewContent;
  final ArtistRouteDetailsGeoLocation detailsContent;
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

  ArtistGeoLocation copyWith({
    ProfileGeoLocation? profile,
    List<String>? specialities,
    GeoLocation? location,
    ArtistRoutePreviewGeoLocation? previewContent,
    ArtistRouteDetailsGeoLocation? detailsContent,
    String? website,
  }) {
    return ArtistGeoLocation(
      id: id,
      profile: profile ?? this.profile,
      specialities: specialities as Map<String, SpecialityGeoLocation>? ??
          this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
      detailsContent: detailsContent ?? this.detailsContent,
      website: website ?? this.website,
    );
  }
}
