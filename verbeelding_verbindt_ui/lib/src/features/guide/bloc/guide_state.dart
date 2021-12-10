import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

part 'guide_state.freezed.dart';

@freezed
class GuideState with _$GuideState {
  const factory GuideState.initializing() = GuideInitializing;

  const factory GuideState.loaded({
    required RouteGeoLocation route,
    required GeoLocation initialUserLocation,
  }) = GuideLoaded;

  const factory GuideState.completed({
    required RouteGeoLocation route,
  }) = GuideCompleted;

  const factory GuideState.failed({
    required GuideFailure failure,
  }) = GuideFailed;
}
