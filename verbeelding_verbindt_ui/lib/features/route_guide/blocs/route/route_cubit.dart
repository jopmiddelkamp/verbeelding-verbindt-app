import 'dart:async';

import 'package:verbeelding_verbindt_core/use_cases/location/fetch_user_location_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/create_route_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/delete_route_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/next_route_stop_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/stream_users_route_use_case.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'route_failure.dart';
import 'route_state.dart';

class RouteCubit extends CubitBase<RouteState> {
  RouteCubit({
    required CreateRouteUseCase createRouteUseCase,
    required DeleteRouteUseCase deleteRouteUseCase,
    required StreamUsersRouteUseCase getUsersRouteUseCase,
    required NextRouteStopUseCase nextRouteStopUseCase,
    required FetchUserLocationUseCase fetchUserLocationUseCase,
  })  : _createRouteUseCase = createRouteUseCase,
        _deleteRouteUseCase = deleteRouteUseCase,
        _getUsersRouteUseCase = getUsersRouteUseCase,
        _nextRouteStopUseCase = nextRouteStopUseCase,
        _fetchUserLocationUseCase = fetchUserLocationUseCase,
        super(const RouteState.initializing());

  final CreateRouteUseCase _createRouteUseCase;
  final DeleteRouteUseCase _deleteRouteUseCase;
  final StreamUsersRouteUseCase _getUsersRouteUseCase;
  final NextRouteStopUseCase _nextRouteStopUseCase;
  final FetchUserLocationUseCase _fetchUserLocationUseCase;

  StreamSubscription? activeRouteStreamSub;

  bool get isLoadedState => state is RouteLoaded;
  bool get isNotLoadedState => !isLoadedState;
  RouteLoaded get loadedState => state as RouteLoaded;

  Future<void> loadRoute() async {
    if (activeRouteStreamSub != null) {
      return;
    }
    final userLocation = await _fetchUserLocationUseCase(null);
    final usersRouteStream = await _getUsersRouteUseCase(null);
    activeRouteStreamSub = usersRouteStream.listen((route) {
      if (route == null) {
        emit(const RouteState.failed(
          failure: RouteFailure.noRouteFound(),
        ));
      } else {
        emit(RouteState.loaded(
          route: route,
          initialUserLocation: userLocation,
        ));
      }
    });
  }

  Future<void> createRoute({
    required final List<String> selectedSpecialityIds,
  }) async {
    await _createRouteUseCase(
      CreateRouteUseCaseArguments(
        selectedSpecialityIds: selectedSpecialityIds,
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
      DeleteRouteUseCaseArguments(
        routeId: loadedState.route.id!,
      ),
    );
  }

  @override
  Future<void> close() {
    activeRouteStreamSub?.cancel();
    return super.close();
  }
}
