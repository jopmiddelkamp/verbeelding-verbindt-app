import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/location.dart';
import 'package:verbeelding_verbindt_core/entities/route.dart';

import 'guide_failure.dart';

part 'guide_state.freezed.dart';

@freezed
class GuideState with _$GuideState {
  const factory GuideState.initializing() = GuideInitializing;

  const factory GuideState.loaded({
    required RouteEntity route,
    required LocationEntity initialUserLocation,
  }) = GuideLoaded;

  const factory GuideState.completed({
    required RouteEntity route,
  }) = GuideCompleted;

  const factory GuideState.failed({
    required GuideFailure failure,
  }) = GuideFailed;
}
