import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'button_state.freezed.dart';

@freezed
class ButtonState with _$ButtonState {
  const factory ButtonState.initializing() = ButtonInitializing;
  const factory ButtonState.idle() = ButtonIdle;
  const factory ButtonState.busy() = ButtonBusy;
  const factory ButtonState.failed([
    Failure? failure,
  ]) = ButtonFailed;
}
