import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

part 'introduction_state.freezed.dart';

@freezed
class IntroductionState with _$IntroductionState {
  const factory IntroductionState.initializing() = IntroductionInitializing;
  const factory IntroductionState.loaded({
    required bool accepted,
  }) = IntroductionLoaded;
  const factory IntroductionState.failed([
    Failure? failure,
  ]) = IntroductionFailed;
}
