import '../../verbeelding_verbindt_core.dart';

abstract class RouteGeneratorRepository {
  Future<List<RouteStop>> generateRouteStops({
    required final Artist artistToStartAt,
    required final Set<Artist> artistsToVisit,
  });
}
