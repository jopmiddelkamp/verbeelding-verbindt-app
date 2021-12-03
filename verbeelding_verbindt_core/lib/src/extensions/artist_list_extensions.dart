import '../../verbeelding_verbindt_core.dart';

extension ArtistListExtensions on List<ArtistEntity> {
  ArtistEntity findByFullName(
    String fullName, {
    ArtistEntity Function()? orElse,
  }) {
    return firstWhere(
      (e) => e.profile.fullName == fullName,
      orElse: orElse,
    );
  }
}

extension ArtistSetExtensions on Set<ArtistEntity> {
  ArtistEntity findByFullName(
    String fullName, {
    ArtistEntity Function()? orElse,
  }) {
    return firstWhere(
      (e) => e.profile.fullName == fullName,
      orElse: orElse,
    );
  }
}
