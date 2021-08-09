import 'package:verbeelding_verbindt_core/entities/common/permission_enum.dart';
import 'package:verbeelding_verbindt_core/usecases/permission/get_permission_status_use_case.dart';
import 'package:verbeelding_verbindt_core/usecases/permission/request_permission_use_case.dart';

import '../cubit_base.dart';
import 'permission_state.dart';

class PermissionCubit extends CubitBase<PermissionState> {
  PermissionCubit({
    required GetPermissionStatusUseCase getPermissionStatusUseCase,
    required RequestPermissionUseCase requestPermissionUseCase,
  })  : _getPermissionStatusUseCase = getPermissionStatusUseCase,
        _requestPermissionUseCase = requestPermissionUseCase,
        super(const PermissionState.initializing());

  final GetPermissionStatusUseCase _getPermissionStatusUseCase;
  final RequestPermissionUseCase _requestPermissionUseCase;

  Future<void> init() async {
    emit(PermissionState.loaded(
      locationWhenInUseStatus: await _getPermissionStatusUseCase.handle(
        GetPermissionStatusUseCaseArguments(
          permission: Permission.locationWhenInUse,
        ),
      ),
    ));
  }

  Future<void> requestLocationWhenInUse() async {
    final status = await _requestPermissionUseCase.handle(
      RequestPermissionUseCaseArguments(
        permission: Permission.locationWhenInUse,
      ),
    );
    if (status is PermissionInitializing) {
      await init();
    } else {
      final loadedState = state as PermissionLoaded;
      emit(loadedState.copyWith(
        locationWhenInUseStatus: status,
      ));
    }
  }
}
