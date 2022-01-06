import '../../verbeelding_verbindt_core.dart';

abstract class RouteRepository {
  Future<void> createRoute(
    Route data,
  );

  Stream<Route?> getRouteStream(
    String id,
  );

  Future<Route?> getRoute(
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
