import 'dart:async';

import '../entities/permission_enum.dart';
import '../entities/permission_status_enum.dart';
import 'repository_base.dart';

abstract class PermissionRepository extends RepositoryBase {
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
