import '../../../verbeelding_verbindt_core.dart';

class GetPermissionStatusUseCase extends UseCase<Future<PermissionStatus>,
    GetPermissionStatusUseCaseParams> {
  GetPermissionStatusUseCase({
    required this.permissionRepository,
  });

  final PermissionRepository permissionRepository;

  @override
  Future<PermissionStatus> call(
    GetPermissionStatusUseCaseParams params,
  ) {
    return permissionRepository.getStatus(
      params.permission,
    );
  }
}

class GetPermissionStatusUseCaseParams {
  GetPermissionStatusUseCaseParams({
    required this.permission,
  });
  final Permission permission;
}
