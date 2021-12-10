import 'dart:async';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class GuideCubit extends CubitBase<GuideState> {
  GuideCubit({
    required CreateRouteUseCase createRouteUseCase,
    required DeleteRouteUseCase deleteRouteUseCase,
    required StreamUsersRouteUseCase getUsersRouteUseCase,
    required NextRouteStopUseCase nextRouteStopUseCase,
    required LocationService locationService,
  })  : _createRouteUseCase = createRouteUseCase,
        _deleteRouteUseCase = deleteRouteUseCase,
        _getUsersRouteUseCase = getUsersRouteUseCase,
        _nextRouteStopUseCase = nextRouteStopUseCase,
        _locationService = locationService,
        super(const GuideState.initializing());

  final CreateRouteUseCase _createRouteUseCase;
  final DeleteRouteUseCase _deleteRouteUseCase;
  final StreamUsersRouteUseCase _getUsersRouteUseCase;
  final NextRouteStopUseCase _nextRouteStopUseCase;
  final LocationService _locationService;

  StreamSubscription? activeRouteStreamSub;

  bool get isLoadedState => state is GuideLoaded;
  bool get isNotLoadedState => !isLoadedState;
  GuideLoaded get loadedState => state as GuideLoaded;

  Future<void> loadRoute() async {
    if (activeRouteStreamSub != null) {
      return;
    }
    final userLocation = await _locationService.getCurrentLocation();
    final usersRouteStream = await _getUsersRouteUseCase(null);
    activeRouteStreamSub = usersRouteStream.listen((route) async {
      if (route == null) {
        emit(const GuideState.failed(
          failure: GuideFailure.noRouteFound(),
        ));
      } else {
        if (route.completed) {
          emit(GuideState.completed(
            route: route,
          ));
        } else {
          emit(GuideState.loaded(
            route: route,
            initialUserLocation: userLocation,
          ));
        }
      }
    });
  }

  Future<void> createRoute({
    required final List<String> selectedSpecialityIds,
  }) async {
    await _createRouteUseCase(
      CreateRouteUseCaseArguments(
        selectedSpecialityIds: selectedSpecialityIds,
        userLocation: await _locationService.getCurrentLocation(),
      ),
    );
    await loadRoute();
  }

  Future<void> next() async {
    if (isNotLoadedState) return;
    await _nextRouteStopUseCase(
      NextRouteStopUseCaseArguments(
        route: loadedState.route,
      ),
    );
  }

  Future<void> delete() async {
    if (isNotLoadedState) return;
    await _deleteRouteUseCase(
      loadedState.route.id!,
    );
  }

  @override
  Future<void> close() {
    activeRouteStreamSub?.cancel();
    return super.close();
  }
}
