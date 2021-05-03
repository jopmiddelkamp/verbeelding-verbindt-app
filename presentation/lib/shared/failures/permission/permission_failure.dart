import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../enums/permission_enum.dart';

abstract class PermissionFailure implements Failure {
  const PermissionFailure({
    required this.permission,
  });

  final Permission permission;
}
