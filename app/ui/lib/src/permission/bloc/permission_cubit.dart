import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class PermissionCubit extends CubitBase<PermissionState> with ReadyMixin {
  PermissionCubit({
    required GetPermissionStatusUseCase getPermissionStatusUseCase,
    required RequestPermissionUseCase requestPermissionUseCase,
  })  : _getPermissionStatus = getPermissionStatusUseCase,
        _requestPermission = requestPermissionUseCase,
        super(const PermissionState.initializing());

  final GetPermissionStatusUseCase _getPermissionStatus;
  final RequestPermissionUseCase _requestPermission;

  Future<void> init() async {
    emit(PermissionState.loaded(
      locationWhenInUseStatus: await _getPermissionStatus(
        GetPermissionStatusUseCaseParams(
          permission: Permission.locationWhenInUse,
        ),
      ),
    ));
    readyCompleter.completeIfNotCompleted();
  }

  Future<void> requestLocationWhenInUse() async {
    final status = await _requestPermission(
      RequestPermissionUseCaseParams(
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
