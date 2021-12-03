import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

part 'localization_state.freezed.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initializing() = LocalizationInitializing;
  const factory LocalizationState.loaded({
    required LocaleEntity locale,
  }) = LocalizationLoaded;
  const factory LocalizationState.failed([
    Failure? failure,
  ]) = LocalizationFailure;
}
