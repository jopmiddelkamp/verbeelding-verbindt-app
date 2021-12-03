import 'dart:async';

import '../../entities/route.dart';
import '../../repositories/route_repository.dart';
import '../use_case_base.dart';

class NextRouteStopUseCase
    extends UseCase<void, NextRouteStopUseCaseArguments> {
  NextRouteStopUseCase({
    required RouteRepository routeRepository,
  }) : _routeRepository = routeRepository;

  final RouteRepository _routeRepository;

  // TODO: improve
  @override
  Future<void> call(
    NextRouteStopUseCaseArguments argument,
  ) async {
    if (argument.route.id == null) {
      throw Exception('TODO: better exception');
    }
    await _routeRepository.completeRouteStop(
      routeId: argument.route.id!,
      stopIndex: argument.route.currentStopIndex,
    );
  }
}

class NextRouteStopUseCaseArguments {
  NextRouteStopUseCaseArguments({
    required this.route,
  });
  final RouteEntity route;
}
