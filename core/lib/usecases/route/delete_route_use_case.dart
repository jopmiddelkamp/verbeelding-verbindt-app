import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

class DeleteRouteUseCase
    extends UseCaseWithArgument<void, DeleteRouteUseCaseArguments> {
  DeleteRouteUseCase({
    required RouteRepository routeRepository,
  }) : _routeRepository = routeRepository;

  final RouteRepository _routeRepository;

  @override
  Future<void> handle(
    DeleteRouteUseCaseArguments argument,
  ) async {
    await _routeRepository.delete(
      argument.routeId,
    );
  }
}

class DeleteRouteUseCaseArguments {
  DeleteRouteUseCaseArguments({
    required this.routeId,
  });
  final String routeId;
}
