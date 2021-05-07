import '../entities/common/artist.dart';
import '../entities/common/route_stop.dart';

abstract class RouteGeneratorRepository {
  Future<List<RouteStopEntity>> generateRouteStops({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artistsToVisit,
  });
}
