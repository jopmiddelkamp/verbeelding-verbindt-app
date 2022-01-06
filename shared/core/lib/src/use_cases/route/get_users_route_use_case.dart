import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class GetUsersRouteUseCase extends UseCase<Future<Route?>, void> {
  GetUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable Route and GetUsersRouteUseCaseFailure union
  @override
  Future<Route?> call(void params) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    return _routeRepository.getRoute(authenticatedUser!.id);
  }
}

class StreamUsersRouteUseCase extends UseCase<Stream<Route?>, void> {
  StreamUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  @override
  Stream<Route?> call(void params) async* {
    final authenticatedUser = await _authRepository.authenticatedUser;
    if (authenticatedUser == null) {
      yield null;
      return;
    }
    yield* _routeRepository.getRouteStream(authenticatedUser.id);
  }
}
