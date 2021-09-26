import '../entities/common/artist.dart';
import '../entities/common/route_stop.dart';
import 'repository_base.dart';

abstract class RouteGeneratorRepository extends RepositoryBase {
  Future<List<RouteStopEntity>> generateRouteStops({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artistsToVisit,
  });
}
