import 'package:permission_handler/permission_handler.dart' as ph;

import '../../../../domain/enums/permission_enum.dart';
import '../../../../domain/enums/permission_status_enum.dart';
import '../../../../domain/failures/permission/unsupported_permission_failure.dart';
import '../../../../domain/failures/persistent_storage/persistent_storage_failure.dart';
import '../../barrel.dart';
import '../permission_service.dart';

class PhLocationPermissionServiceImpl extends PermissionService {
  PhLocationPermissionServiceImpl({
    required PersistentStorageService persistentStorageService,
  }) : _persistentStorage = persistentStorageService;

  final PersistentStorageService _persistentStorage;

  @override

  /// Gets the status of the permission argument. Returns [PermissonStatus] if
  /// succesfull or if failed [UnsupportedPermissionFailure] or
  /// [TypeMismatchPersistentStorageFailure].
  Future<PermissionStatus> getStatus(
    Permission permission,
  ) async {
    try {
      final requestedBefore =
          await _persistentStorage.getHasPermissionBeenRequested(
        permission,
      );
      if (!requestedBefore) {
        return PermissionStatus.undetermined;
      }
      final nativePermission = _getNativePermission(
        permission,
      );
      final nativePermissionStatus = await nativePermission.status;
      final result = await _getPermissionStatus(
        nativePermissionStatus,
      );
      return result;
    } on TypeMismatchPersistentStorageFailure {
      rethrow;
    }
  }

  ph.Permission _getNativePermission(Permission permission) {
    if (!_permissionsMap.containsKey(permission)) {
      throw UnsupportedPermissionFailure(permission: permission);
    }
    final nativePermission = _permissionsMap[permission] as ph.Permission;
    return nativePermission;
  }

  @override

  /// Requests permissions if needed for the permission argument. Returns
  /// [PermissonStatus] if succesfull or if failed
  /// [UnsupportedPermissionFailure] or [TypeMismatchPersistentStorageFailure].
  Future<PermissionRequestReponse> requestIfNeeded(
    Permission permission,
  ) async {
    final status = await getStatus(
      permission,
    );
    if (status == PermissionStatus.granted) {
      return PermissionRequestReponse(
        oldStatus: PermissionStatus.granted,
        newStatus: PermissionStatus.granted,
      );
    }
    final nativePermission = _getNativePermission(permission);
    final newStatus = await _requestDeviceForPermission(
      nativePermission,
    );
    await _persistentStorage.setHasPermissionBeenRequested(
      permission: permission,
    );
    return PermissionRequestReponse(
      oldStatus: status,
      newStatus: newStatus,
    );
  }

  Future<PermissionStatus> _getPermissionStatus(
      ph.PermissionStatus status) async {
    if (await status.isRestricted) {
      return PermissionStatus.restricted;
    }
    if (await status.isGranted) {
      return PermissionStatus.granted;
    }
    if (await status.isDenied) {
      return PermissionStatus.denied;
    }
    return PermissionStatus.removed;
  }

  Future<PermissionStatus> _requestDeviceForPermission(
    ph.Permission permission,
  ) async {
    final status = await permission.request();
    return _getPermissionStatus(
      status,
    );
  }

  final _permissionsMap = <Permission, ph.Permission>{
    Permission.location: ph.Permission.locationWhenInUse,
  };
}
