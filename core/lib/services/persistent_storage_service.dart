import 'dart:async';

import '../enums/permission_enum.dart';
import '../failures/persistent_storage/persistent_storage_failure.dart';

abstract class PersistentStorageService {
  /// Returns if the intro has been accepted. Returns [bool] if successful or
  /// throws a [TypeMismatchPersistentStorageFailure] if failed.
  Future<bool> getIsIntroAccepted();

  /// Set if the intro has been accepted
  Future<void> setIntroAccepted(
    // ignore: avoid_positional_boolean_parameters
    bool value,
  );

  /// Returns if the permission has been requested before. Returns [bool] if
  /// successful or throws a [TypeMismatchPersistentStorageFailure] if failed.
  Future<bool> getHasPermissionBeenRequested(
    Permission permission,
  );

  /// Set if the permission has been requested before.
  Future<void> setHasPermissionBeenRequested({
    required Permission permission,
  });
}
