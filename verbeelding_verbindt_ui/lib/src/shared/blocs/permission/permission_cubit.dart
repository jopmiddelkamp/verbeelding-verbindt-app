import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

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
      locationWhenInUseStatus: await _getPermissionStatusUseCase(
        GetPermissionStatusUseCaseArguments(
          permission: Permission.locationWhenInUse,
        ),
      ),
    ));
  }

  Future<void> requestLocationWhenInUse() async {
    final status = await _requestPermissionUseCase(
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
