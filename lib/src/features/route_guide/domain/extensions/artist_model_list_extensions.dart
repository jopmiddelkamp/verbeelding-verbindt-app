import '../models/artist_model.dart';

extension ArtistModelListExtensions on List<ArtistModel> {
  ArtistModel findByFullName(
    String fullName, {
    ArtistModel Function()? orElse,
  }) {
    return firstWhere(
      (e) => e.profile.fullName == fullName,
      orElse: orElse,
    );
  }
}

extension ArtistModelSetExtensions on Set<ArtistModel> {
  ArtistModel findByFullName(
    String fullName, {
    ArtistModel Function()? orElse,
  }) {
    return firstWhere(
      (e) => e.profile.fullName == fullName,
      orElse: orElse,
    );
  }
}
