import 'dart:async';

import '../../verbeelding_verbindt_core.dart';

abstract class PermissionRepository {
  /// Gets the status of the permission argument. Returns [PermissonStatus] or
  /// throws [UnsupportedPermissionFailure] or
  /// [TypeMismatchPersistentStorageFailure] on failure.
  Future<PermissionStatus> getStatus(
    Permission permission,
  );

  /// Requests permissions. Throws [UnsupportedPermissionFailure] or
  /// [TypeMismatchPersistentStorageFailure] on failure.
  Future<PermissionStatus> request(
    Permission permission,
  );
}
