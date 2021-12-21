import 'dart:async';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepsOverviewCubit extends CubitBase<StepsOverviewState> {
  StepsOverviewCubit({
    required DeleteRouteUseCase deleteRouteUseCase,
    required StreamUsersRouteUseCase getUsersRouteUseCase,
    required CompleteRouteStopUseCase completeRouteStopUseCase,
    required LocationService locationService,
  })  : _deleteRoute = deleteRouteUseCase,
        _streamUsersRoute = getUsersRouteUseCase,
        _completeRouteStop = completeRouteStopUseCase,
        _locationService = locationService,
        super(const StepsOverviewState.initializing());

  final DeleteRouteUseCase _deleteRoute;
  final StreamUsersRouteUseCase _streamUsersRoute;
  final CompleteRouteStopUseCase _completeRouteStop;
  final LocationService _locationService;

  StreamSubscription? activeRouteStreamSub;

  bool get isLoadedState => state is StepsOverviewLoaded;
  bool get isNotLoadedState => !isLoadedState;

  StepsOverviewLoaded get loadedState => state as StepsOverviewLoaded;

  Future<void> init() async {
    if (activeRouteStreamSub != null) {
      return;
    }
    activeRouteStreamSub = _streamUsersRoute(null).listen((route) async {
      if (route == null) {
        return;
      } else if (route.completed) {
        emit(const StepsOverviewState.completed());
      } else {
        if (state is! StepsOverviewLoaded) {
          final userLocation = await _locationService.getCurrentLocation();
          emit(StepsOverviewState.loaded(
            route: route,
            initialUserLocation: userLocation,
          ));
        } else {
          emit(loadedState.copyWith(
            route: route,
          ));
        }
      }
    });
  }

  Future<void> next() async {
    if (isNotLoadedState) {
      return;
    }
    await _completeRouteStop(
      CompleteRouteStopUseCaseParams(
        routeId: loadedState.route.id!,
        stopIndex: loadedState.route.currentStopIndex,
      ),
    );
  }

  Future<void> delete() async {
    if (isNotLoadedState) {
      return;
    }
    await _deleteRoute(
      loadedState.route.id!,
    );
  }

  @override
  Future<void> close() {
    activeRouteStreamSub?.cancel();
    return super.close();
  }
}
