import '../entities/common/route.dart';

abstract class RouteRepository {
  Future<void> createRoute(
    RouteEntity data,
  );

  Stream<RouteEntity?> getRoute(
    String id,
  );

  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  });
}
