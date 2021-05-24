import '../enums/permission_enum.dart';
import '../enums/permission_status_enum.dart';

abstract class PermissionService {
  Future<PermissionStatus> getStatus(
    Permission permission,
  );
  Future<PermissionRequestReponse> requestIfNeeded(
    Permission permission,
  );
}

class PermissionRequestReponse {
  const PermissionRequestReponse({
    required this.oldStatus,
    required this.newStatus,
  });
  final PermissionStatus oldStatus;
  final PermissionStatus newStatus;
}
