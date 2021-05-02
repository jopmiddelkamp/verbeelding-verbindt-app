import '../entities/route.dart';

abstract class RouteRepository {
  Future<void> createRoute(
    RouteEntity data,
  );

  Stream<RouteEntity?> getRoute(
    String id,
  );
}
