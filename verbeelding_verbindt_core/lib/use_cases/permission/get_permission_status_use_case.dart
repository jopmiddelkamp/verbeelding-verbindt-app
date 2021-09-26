import '../../entities/common/permission_enum.dart';
import '../../entities/common/permission_status_enum.dart';
import '../../repositories/permission_repository.dart';
import '../use_case_base.dart';

class GetPermissionStatusUseCase
    extends UseCase<PermissionStatus, GetPermissionStatusUseCaseArguments> {
  GetPermissionStatusUseCase({
    required this.permissionRepository,
  });

  final PermissionRepository permissionRepository;

  @override
  Future<PermissionStatus> call(
    GetPermissionStatusUseCaseArguments argument,
  ) {
    return permissionRepository.getStatus(
      argument.permission,
    );
  }
}

class GetPermissionStatusUseCaseArguments {
  GetPermissionStatusUseCaseArguments({
    required this.permission,
  });
  final Permission permission;
}
