import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'intro_state.freezed.dart';

@freezed
class IntroState with _$IntroState {
  const factory IntroState.initializing() = IntroInitializing;
  const factory IntroState.loaded({
    required bool accepted,
  }) = IntroLoaded;
  const factory IntroState.failed([
    Failure? failure,
  ]) = IntroFailed;
}
