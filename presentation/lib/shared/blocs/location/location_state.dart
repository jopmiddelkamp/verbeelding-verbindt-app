import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initializing() = LocationInitializing;
  const factory LocationState.loaded({
    required LocationEntity location,
  }) = LocationLoaded;
  const factory LocationState.failed([
    Failure? failure,
  ]) = LocationFailed;
}
