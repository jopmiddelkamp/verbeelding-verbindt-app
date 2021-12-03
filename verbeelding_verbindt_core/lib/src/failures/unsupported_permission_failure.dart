import '../../verbeelding_verbindt_core.dart';

class UnsupportedPermissionFailure extends PermissionFailure {
  const UnsupportedPermissionFailure({
    required Permission permission,
  }) : super(permission: permission);
}
