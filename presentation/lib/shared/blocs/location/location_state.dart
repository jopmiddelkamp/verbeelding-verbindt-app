import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'location_state.freezed.dart';

// TODO: other states same naming convension
@freezed
class LocationState with _$LocationState {
  const factory LocationState.initializing() = InitializingLocationState;
  const factory LocationState.loaded({
    required LocationEntity location,
  }) = LoadedLocationState;
  const factory LocationState.failed([
    Failure? failure,
  ]) = FailureLocationState;
}
