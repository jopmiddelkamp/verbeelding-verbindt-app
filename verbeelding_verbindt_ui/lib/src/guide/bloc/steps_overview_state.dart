import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

part 'steps_overview_state.freezed.dart';

@freezed
class StepsOverviewState with _$StepsOverviewState {
  const factory StepsOverviewState.initializing() = StepsOverviewInitializing;

  const factory StepsOverviewState.loaded({
    required Route route,
    required Geolocation initialUserLocation,
  }) = StepsOverviewLoaded;

  const factory StepsOverviewState.completed() = StepsOverviewCompleted;

  const factory StepsOverviewState.failed({
    required StepsOverviewFailure failure,
  }) = StepsOverviewFailed;
}
