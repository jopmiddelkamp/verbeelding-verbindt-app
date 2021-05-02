import '../entities/artist.dart';
import '../entities/route_stop.dart';

// ignore: one_member_abstracts
abstract class RouteGeneratorRepository {
  Future<List<RouteStopEntity>> generateRouteStops({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artistsToVisit,
  });
}
