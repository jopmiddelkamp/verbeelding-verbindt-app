import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class GetHasUsersRouteUseCase extends UseCase<Future<bool>, void> {
  GetHasUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable Route and GetUsersRouteUseCaseFailure union
  @override
  Future<bool> call(void params) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    if (authenticatedUser == null) {
      return false;
    }
    return _routeRepository.routeExists(authenticatedUser.id);
  }
}
