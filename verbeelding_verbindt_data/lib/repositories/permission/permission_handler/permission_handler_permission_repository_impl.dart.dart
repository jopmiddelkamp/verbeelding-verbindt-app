import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:verbeelding_verbindt_core/entities/permission_enum.dart';
import 'package:verbeelding_verbindt_core/entities/permission_status_enum.dart';
import 'package:verbeelding_verbindt_core/repositories/permission_repository.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../persistent_storage/persistent_storage_repository.dart';

class PermissionHandlerPermissionRepositoryImpl extends PermissionRepository {
  PermissionHandlerPermissionRepositoryImpl({
    required this.persistentStorageRepository,
  });

  final PersistentStorageRepository persistentStorageRepository;

  @override
  Future<PermissionStatus> getStatus(
    Permission permission,
  ) async {
    final isRequestedBefore = await _getRequestedBefore(permission);
    if (!isRequestedBefore) {
      return PermissionStatus.undetermined;
    }
    final status = await permission.toPermissionHandlerModel().status;
    return status.toEntity();
  }

  Future<bool> _getRequestedBefore(
    Permission permission,
  ) {
    return persistentStorageRepository.getBoolOrElse(
      EnumUtils.getStringValue(permission),
      orElse: false,
    );
  }

  Future<void> _setRequestedBefore(
    Permission permission,
  ) {
    return persistentStorageRepository.setBool(
      EnumUtils.getStringValue(permission),
      true,
    );
  }

  @override
  Future<PermissionStatus> request(
    Permission permission,
  ) async {
    final status = await permission.toPermissionHandlerModel().request();
    await _setRequestedBefore(permission);
    return status.toEntity();
  }
}

extension on Permission {
  permission_handler.Permission toPermissionHandlerModel() {
    return <Permission, permission_handler.Permission>{
      Permission.locationWhenInUse:
          permission_handler.Permission.locationWhenInUse,
    }[this]!;
  }
}

extension on permission_handler.PermissionStatus {
  PermissionStatus toEntity() {
    if (isRestricted) {
      return PermissionStatus.restricted;
    }
    if (isGranted) {
      return PermissionStatus.granted;
    }
    if (isDenied) {
      return PermissionStatus.denied;
    }
    return PermissionStatus.removed;
  }
}
