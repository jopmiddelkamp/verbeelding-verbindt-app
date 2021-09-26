import '../entities/common/permission_enum.dart';
import 'permission_failure.dart';

class InsufficientPermissionsFailure extends PermissionFailure {
  InsufficientPermissionsFailure({
    required Permission permission,
  }) : super(permission: permission);
}
