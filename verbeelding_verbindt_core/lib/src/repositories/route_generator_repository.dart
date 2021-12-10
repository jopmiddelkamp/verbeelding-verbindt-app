import '../../verbeelding_verbindt_core.dart';

abstract class RouteGeneratorRepository extends RepositoryBase {
  Future<List<RouteStopGeoLocation>> generateRouteStops({
    required final ArtistGeoLocation artistToStartAt,
    required final Set<ArtistGeoLocation> artistsToVisit,
  });
}
