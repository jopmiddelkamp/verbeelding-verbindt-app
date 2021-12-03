import '../../verbeelding_verbindt_core.dart';

abstract class RouteGeneratorRepository extends RepositoryBase {
  Future<List<RouteStopEntity>> generateRouteStops({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artistsToVisit,
  });
}
