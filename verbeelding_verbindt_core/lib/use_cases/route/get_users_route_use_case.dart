import 'dart:async';

import '../../entities/route.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

class GetUsersRouteUseCase extends UseCase<RouteEntity?, void> {
  GetUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and GetUsersRouteUseCaseFailure union
  @override
  Future<RouteEntity?> call(
    void argument,
  ) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    return _routeRepository.getRoute(authenticatedUser!.id);
  }
}
