import '../../../verbeelding_verbindt_core.dart';

class RequestPermissionUseCase
    extends UseCase<Future<PermissionStatus>, RequestPermissionUseCaseParams> {
  RequestPermissionUseCase({
    required this.permissionRepository,
  });

  final PermissionRepository permissionRepository;

  @override
  Future<PermissionStatus> call(
    RequestPermissionUseCaseParams params,
  ) async {
    var status = await permissionRepository.getStatus(
      params.permission,
    );
    if (status == PermissionStatus.granted) {
      return status;
    }
    return await permissionRepository.request(
      params.permission,
    );
  }
}

class RequestPermissionUseCaseParams {
  RequestPermissionUseCaseParams({
    required this.permission,
  });
  final Permission permission;
}
