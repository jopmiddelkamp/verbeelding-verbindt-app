import '../../../domain/models/artist_model.dart';
import '../../../domain/models/route_stop_model.dart';

// ignore: one_member_abstracts
abstract class RouteGeneratorRepository {
  Future<List<RouteStopModel>> generateRouteStops({
    required final ArtistModel artistToStartAt,
    required final Set<ArtistModel> artistsToVisit,
  });
}
