import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamUsersRouteUseCase extends UseCase<Stream<RouteEntity?>, void> {
  StreamUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and GetUsersRouteUseCaseFailure union
  @override
  Future<Stream<RouteEntity?>> call(
    void argument,
  ) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    return _routeRepository.getRouteStream(authenticatedUser!.id);
  }
}
