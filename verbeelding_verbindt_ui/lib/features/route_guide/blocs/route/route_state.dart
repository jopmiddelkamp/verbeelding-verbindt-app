import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/entities/common/route.dart';

import 'route_failure.dart';

part 'route_state.freezed.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState.initializing() = RouteInitializing;

  const factory RouteState.loaded({
    required RouteEntity route,
    required LocationEntity initialUserLocation,
  }) = RouteLoaded;

  const factory RouteState.failed({
    required RouteFailure failure,
  }) = RouteFailed;
}
