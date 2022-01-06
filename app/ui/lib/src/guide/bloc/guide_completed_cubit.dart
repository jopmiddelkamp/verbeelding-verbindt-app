import 'dart:async';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class GuideCompletedCubit extends CubitBase<GuideCompletedState> {
  GuideCompletedCubit({
    required DeleteRouteUseCase deleteRouteUseCase,
    required GetUsersRouteUseCase getUsersRouteUseCase,
  })  : _deleteRoute = deleteRouteUseCase,
        _getUsersRoute = getUsersRouteUseCase,
        super(const GuideCompletedState.initializing());

  final DeleteRouteUseCase _deleteRoute;
  final GetUsersRouteUseCase _getUsersRoute;

  bool get isLoadedState => state is GuideCompletedLoaded;
  bool get isNotLoadedState => !isLoadedState;

  GuideCompletedLoaded get loadedState => state as GuideCompletedLoaded;

  Future<void> init() async {
    final route = await _getUsersRoute(null);
    if (route == null) {
      emit(const GuideCompletedState.failed());
      return;
    }
    emit(GuideCompletedState.loaded(
      route: route,
    ));
  }

  Future<void> delete() async {
    if (isNotLoadedState) {
      return;
    }
    await _deleteRoute(
      loadedState.route.id!,
    );
  }
}
