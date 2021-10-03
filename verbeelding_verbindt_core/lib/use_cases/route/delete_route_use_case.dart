import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

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
