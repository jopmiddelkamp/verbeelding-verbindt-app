import '../../../verbeelding_verbindt_core.dart';

class DeleteRouteUseCase extends UseCase<Future<void>, String> {
  DeleteRouteUseCase({
    required RouteRepository routeRepository,
  }) : _routeRepository = routeRepository;

  final RouteRepository _routeRepository;

  @override
  Future<void> call(
    String params,
  ) async {
    await _routeRepository.delete(
      params,
    );
  }
}
