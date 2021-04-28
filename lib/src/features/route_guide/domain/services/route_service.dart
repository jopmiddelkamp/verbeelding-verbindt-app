import 'package:platform_device_id/platform_device_id.dart';

import '../../../../shared/domain/services/service_base.dart';
import '../../data/repositories/route/route_repository.dart';
import '../../data/repositories/route_generator/route_generator_repository.dart';
import '../models/artist_model.dart';
import '../models/route_model.dart';

abstract class RouteService {
  Future<void> createRoute({
    required final ArtistModel artistToStartAt,
    required final Set<ArtistModel> artists,
  });
  Stream<RouteModel?> getRoute();
}

class RouteServiceImpl extends ServiceBase implements RouteService {
  const RouteServiceImpl({
    required final RouteRepository routeRepository,
    required final RouteGeneratorRepository routeGeneratorRepository,
  })   : _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository;

  final RouteRepository _routeRepository;
  final RouteGeneratorRepository _routeGeneratorRepository;

  @override
  Future<void> createRoute({
    required final ArtistModel artistToStartAt,
    required final Set<ArtistModel> artists,
  }) async {
    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artistToStartAt,
      artistsToVisit: artists,
    );
    final data = RouteModel(
      id: await PlatformDeviceId.getDeviceId,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
  }

  @override
  Stream<RouteModel?> getRoute() async* {
    final platformDeviceId = await PlatformDeviceId.getDeviceId;
    yield* _routeRepository.getRoute(
      platformDeviceId!,
    );
  }
}
