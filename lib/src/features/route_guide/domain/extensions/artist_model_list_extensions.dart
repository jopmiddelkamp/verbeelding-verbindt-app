import '../../../../shared/domain/models/location_model.dart';
import '../../../../shared/utils/location_utils.dart';
import '../models/artist_model.dart';

extension ArtistModelListExtensions on List<ArtistModel> {
  void sortByDistance(
    LocationModel location,
  ) {
    sort((a, b) {
      final distanceToA = LocationUtils.distanceBetween(
        location,
        a.location,
      );
      final distanceToB = LocationUtils.distanceBetween(
        location,
        b.location,
      );
      return distanceToA.compareTo(distanceToB); // Sort by closest
    });
  }

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
