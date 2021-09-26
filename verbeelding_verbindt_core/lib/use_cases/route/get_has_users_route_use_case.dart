import 'dart:async';

import '../../repositories/auth_repository.dart';
import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

class GetHasUsersRouteUseCase extends UseCase<bool, void> {
  GetHasUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and GetUsersRouteUseCaseFailure union
  @override
  Future<bool> call(
    void argument,
  ) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    if (authenticatedUser == null) {
      return false;
    }
    return _routeRepository.routeExists(authenticatedUser.id);
  }
}
