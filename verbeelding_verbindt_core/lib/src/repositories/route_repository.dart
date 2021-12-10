import '../../verbeelding_verbindt_core.dart';

abstract class RouteRepository extends RepositoryBase {
  Future<void> createRoute(
    RouteGeoLocation data,
  );

  Stream<RouteGeoLocation?> getRouteStream(
    String id,
  );

  Future<RouteGeoLocation?> getRoute(
    String id,
  );

  Future<bool> routeExists(
    String id,
  );

  Future<void> delete(
    String id,
  );

  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  });
}
