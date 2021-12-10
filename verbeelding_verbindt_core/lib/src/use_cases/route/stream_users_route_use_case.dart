import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class StreamUsersRouteUseCase extends UseCase<Stream<RouteGeoLocation?>, void> {
  StreamUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable RouteGeoLocation and GetUsersRouteUseCaseFailure union
  @override
  Future<Stream<RouteGeoLocation?>> call(
    void argument,
  ) async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    return _routeRepository.getRouteStream(authenticatedUser!.id);
  }
}
