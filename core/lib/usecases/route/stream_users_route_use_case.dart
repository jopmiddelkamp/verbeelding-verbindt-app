import 'dart:async';

import '../../entities/common/route.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

class StreamUsersRouteUseCase extends UseCase<Stream<RouteEntity?>> {
  StreamUsersRouteUseCase({
    required RouteRepository routeRepository,
    required AuthRepository authRepository,
  })  : _routeRepository = routeRepository,
        _authRepository = authRepository;

  final RouteRepository _routeRepository;
  final AuthRepository _authRepository;

  // TODO: rewrite with Either with non nullable RouteEntity and GetUsersRouteUseCaseFailure union
  @override
  Future<Stream<RouteEntity?>> handle() async {
    final authenticatedUser = await _authRepository.authenticatedUser;
    return _routeRepository.getRouteStream(authenticatedUser!.id);
  }
}
