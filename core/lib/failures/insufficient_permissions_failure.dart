import '../enums/permission_enum.dart';
import '../services/permission_service.dart';
import 'permission_failure.dart';

class InsufficientPermissionsFailure extends PermissionFailure {
  InsufficientPermissionsFailure({
    required Permission permission,
    required this.response,
  }) : super(permission: permission);

  final PermissionRequestReponse response;
}
