import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_state.freezed.dart';

@freezed
class CompletedState with _$CompletedState {
  const factory CompletedState.loaded() = CompletedLoaded;
}
