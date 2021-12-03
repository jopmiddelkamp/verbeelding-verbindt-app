import '../../verbeelding_verbindt_core.dart';

abstract class RouteRepository extends RepositoryBase {
  Future<void> createRoute(
    RouteEntity data,
  );

  Stream<RouteEntity?> getRouteStream(
    String id,
  );

  Future<RouteEntity?> getRoute(
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
