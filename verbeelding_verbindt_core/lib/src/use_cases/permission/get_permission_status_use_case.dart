import '../../../verbeelding_verbindt_core.dart';

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
