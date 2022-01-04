import '../../verbeelding_verbindt_core.dart';

abstract class RouteGeneratorRepository {
  Future<List<Artist>> generateRoute({
    required final Set<String> artistIds,
    required Geolocation userLocation,
  });
}
