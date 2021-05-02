import '../entities/artist.dart';
import '../entities/route.dart';
import '../repositories/route_generator_repository.dart';
import '../repositories/route_repository.dart';
import '../services/service_base.dart';

abstract class RouteService {
  Future<void> createRoute({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artists,
  });
  Stream<RouteEntity?> getRoute();
}

class RouteServiceImpl extends ServiceBase implements RouteService {
  const RouteServiceImpl({
    required final RouteRepository routeRepository,
    required final RouteGeneratorRepository routeGeneratorRepository,
    required final String deviceId,
  })   : _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository,
        _deviceId = deviceId;

  final RouteRepository _routeRepository;
  final RouteGeneratorRepository _routeGeneratorRepository;
  final String _deviceId;

  @override
  Future<void> createRoute({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artists,
  }) async {
    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artistToStartAt,
      artistsToVisit: artists,
    );
    final data = RouteEntity(
      id: _deviceId,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
  }

  @override
  Stream<RouteEntity?> getRoute() async* {
    yield* _routeRepository.getRoute(
      _deviceId,
    );
  }
}
