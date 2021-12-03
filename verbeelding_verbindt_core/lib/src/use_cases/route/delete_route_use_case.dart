import '../../../verbeelding_verbindt_core.dart';

class DeleteRouteUseCase extends UseCase<void, String> {
  DeleteRouteUseCase({
    required RouteRepository routeRepository,
  }) : _routeRepository = routeRepository;

  final RouteRepository _routeRepository;

  @override
  Future<void> call(
    String argument,
  ) async {
    await _routeRepository.delete(
      argument,
    );
  }
}
