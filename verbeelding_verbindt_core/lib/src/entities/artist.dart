import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class Artist extends Equatable {
  const Artist({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
    required this.detailsContent,
    required this.website,
  });

  final String? id;
  final Profile profile;
  final Map<String, Speciality> specialities;
  final Geolocation location;
  final ArtistRoutePreview previewContent;
  final ArtistRouteDetails detailsContent;
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

  Artist copyWith({
    Profile? profile,
    List<String>? specialities,
    Geolocation? location,
    ArtistRoutePreview? previewContent,
    ArtistRouteDetails? detailsContent,
    String? website,
  }) {
    return Artist(
      id: id,
      profile: profile ?? this.profile,
      specialities:
          specialities as Map<String, Speciality>? ?? this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
      detailsContent: detailsContent ?? this.detailsContent,
      website: website ?? this.website,
    );
  }
}
