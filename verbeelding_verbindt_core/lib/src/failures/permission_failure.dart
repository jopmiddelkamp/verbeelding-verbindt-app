import '../../verbeelding_verbindt_core.dart';

abstract class PermissionFailure implements Failure {
  const PermissionFailure({
    required this.permission,
  });

  final Permission permission;
}
