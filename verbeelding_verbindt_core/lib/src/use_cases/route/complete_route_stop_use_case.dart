import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class CompleteRouteStopUseCase
    extends UseCase<Future<void>, CompleteRouteStopUseCaseParams> {
  CompleteRouteStopUseCase({
    required RouteRepository routeRepository,
  }) : _routeRepository = routeRepository;

  final RouteRepository _routeRepository;

  // TODO: improve
  @override
  Future<void> call(
    CompleteRouteStopUseCaseParams params,
  ) async {
    await _routeRepository.completeRouteStop(
      routeId: params.routeId,
      stopIndex: params.stopIndex,
    );
  }
}

class CompleteRouteStopUseCaseParams {
  CompleteRouteStopUseCaseParams({
    required this.routeId,
    required this.stopIndex,
  });
  final String routeId;
  final int stopIndex;
}
