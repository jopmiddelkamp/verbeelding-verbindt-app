import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

part 'guide_completed_state.freezed.dart';

@freezed
class GuideCompletedState with _$GuideCompletedState {
  const factory GuideCompletedState.initializing() = GuideCompletedInitializing;

  const factory GuideCompletedState.loaded({
    required Route route,
  }) = GuideCompletedLoaded;

  const factory GuideCompletedState.failed() = GuideCompletedFailed;
}
