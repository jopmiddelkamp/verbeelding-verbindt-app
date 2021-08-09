import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/route.dart';

import 'route_failure.dart';

part 'route_state.freezed.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState.initializing() = InitializingRouteState;

  const factory RouteState.loaded({
    required RouteEntity route,
  }) = LoadedRouteState;

  const factory RouteState.failed({
    required RouteFailure failure,
  }) = FailureRouteState;
}
