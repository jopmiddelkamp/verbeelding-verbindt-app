import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/permission_status_enum.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'permission_state.freezed.dart';

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState.initializing() = PermissionInitializing;
  const factory PermissionState.loaded({
    required PermissionStatus locationWhenInUseStatus,
  }) = PermissionLoaded;
  const factory PermissionState.failed([
    Failure? failure,
  ]) = PermissionFailure;
}
