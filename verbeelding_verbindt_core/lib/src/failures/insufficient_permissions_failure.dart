import '../../verbeelding_verbindt_core.dart';

class InsufficientPermissionsFailure extends PermissionFailure {
  InsufficientPermissionsFailure({
    required Permission permission,
  }) : super(permission: permission);
}
