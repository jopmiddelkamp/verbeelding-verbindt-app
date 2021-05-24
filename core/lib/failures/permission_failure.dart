import '../enums/permission_enum.dart';
import 'failure.dart';

abstract class PermissionFailure implements Failure {
  const PermissionFailure({
    required this.permission,
  });

  final Permission permission;
}
