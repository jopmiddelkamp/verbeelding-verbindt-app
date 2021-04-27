import 'package:permission_handler/permission_handler.dart' as ph;

import '../../../enums/permission_enum.dart';
import '../../../enums/permission_status_enum.dart';
import '../../../failures/permission/unsupported_permission_failure.dart';
import '../../../failures/persistent_storage/persistent_storage_failure.dart';
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
      final nativePermission = _getNativePermission(
        permission,
      );
      final result = await _requestDeviceForPermission(
        nativePermission,
        requestedBefore: requestedBefore,
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
    final nativePermission = _getNativePermission(permission);
    if (await nativePermission.isGranted) {
      return PermissionRequestReponse(
        oldStatus: PermissionStatus.granted,
        newStatus: PermissionStatus.granted,
      );
    }
    final oldStatus = await getStatus(
      permission,
    );
    final requestedBefore = oldStatus != PermissionStatus.undetermined;
    final result = await _requestDeviceForPermission(
      nativePermission,
      requestedBefore: requestedBefore,
    );
    await _persistentStorage.setHasPermissionBeenRequested(
      permission: permission,
    );
    return PermissionRequestReponse(
      oldStatus: oldStatus,
      newStatus: result,
    );
  }

  Future<PermissionStatus> _getPermissionStatus(
    ph.PermissionStatus status, {
    bool requestedBefore = false,
  }) async {
    if (!requestedBefore) {
      return PermissionStatus.undetermined;
    }
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
    ph.Permission permission, {
    bool requestedBefore = false,
  }) async {
    final status = await permission.request();
    return _getPermissionStatus(
      status,
      requestedBefore: requestedBefore,
    );
  }

  final _permissionsMap = <Permission, ph.Permission>{
    Permission.location: ph.Permission.locationWhenInUse,
  };
}
