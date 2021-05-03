import '../../enums/permission_enum.dart';
import 'permission_failure.dart';

class UnsupportedPermissionFailure extends PermissionFailure {
  const UnsupportedPermissionFailure({
    required Permission permission,
  }) : super(permission: permission);
}
