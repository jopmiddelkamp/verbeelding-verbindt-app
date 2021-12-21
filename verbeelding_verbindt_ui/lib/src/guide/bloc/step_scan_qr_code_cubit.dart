import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepScanQrCodeCubit extends ScanQrCodeCubit {
  StepScanQrCodeCubit({
    required this.params,
    required GetUsersRouteUseCase getUsersRouteUseCase,
    required CompleteRouteStopUseCase completeRouteStopUseCase,
  })  : _getUsersRoute = getUsersRouteUseCase,
        _completeRouteStop = completeRouteStopUseCase,
        super();

  final StepScanQrCodeParams params;
  final GetUsersRouteUseCase _getUsersRoute;
  final CompleteRouteStopUseCase _completeRouteStop;

  late String _routeId;
  late QrCodeValidator _validator;

  @override
  Future<void> init() async {
    final route = await _getUsersRoute(null);
    if (route == null || route.stops.length <= params.stepIndex) {
      emit(const ScanQrCodeState.invalidParams());
      return await super.init();
    }
    _routeId = route.id!;
    final stop = route.stops[params.stepIndex];
    _validator = QrCodeValidator(
      expectedValue: stop.artist.id!,
    );
    await super.init();
  }

  @override
  Future<bool> validate(String value) async => _validator.validate(value);

  @override
  Future<void> process() async {
    await _completeRouteStop(CompleteRouteStopUseCaseParams(
      routeId: _routeId,
      stopIndex: params.stepIndex,
    ));
  }
}
