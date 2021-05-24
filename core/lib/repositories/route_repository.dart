import '../entities/common/route.dart';
import 'repository_base.dart';

abstract class RouteRepository extends RepositoryBase {
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
