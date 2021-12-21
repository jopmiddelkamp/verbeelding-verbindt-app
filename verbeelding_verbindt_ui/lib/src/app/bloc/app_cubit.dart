import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class AppCubit extends CubitBase<AppState> with ReadyMixin, DisposableMixin {
  AppCubit({
    required SignInAnonymouslyUseCase signInAnonymouslyUseCase,
    required StreamIsIntroAcceptedUseCase streamIsIntroAcceptedUseCase,
    required StreamAuthenticatedUserUseCase streamAuthenticatedUserUseCase,
    required StreamUsersRouteUseCase streamUsersRouteUseCase,
  })  : _signInAnonymously = signInAnonymouslyUseCase,
        _streamIsIntroAccepted = streamIsIntroAcceptedUseCase,
        _streamAuthenticatedUser = streamAuthenticatedUserUseCase,
        _streamUsersRoute = streamUsersRouteUseCase,
        super(const AppState.initializing()) {
    routeRefreshStream.listen((event) {
      debugPrint('### routeRefreshStream: $event');
    });
  }

  final SignInAnonymouslyUseCase _signInAnonymously;
  final StreamIsIntroAcceptedUseCase _streamIsIntroAccepted;
  final StreamAuthenticatedUserUseCase _streamAuthenticatedUser;
  final StreamUsersRouteUseCase _streamUsersRoute;

  late StreamSubscription _streamSub;

  AppLoaded get loadedState => state as AppLoaded;

  Stream<bool> get routeRefreshStream => stream
      .where((state) => state is AppLoaded)
      .map((state) => (state as AppLoaded).hasSignedIn)
      .distinct();

  Future<void> init() async {
    await _signInAnonymously(null);
    _streamSub = combineLatestTuple3(
      stream1: _streamIsIntroAccepted(null),
      stream2: _streamAuthenticatedUser(null),
      stream3: _streamUsersRoute(null),
    ).takeUntil(dispose$).listen((tuple) {
      emit(AppState.loaded(
        hasAcceptedIntro: tuple.item1,
        hasSignedIn: tuple.item2 != null,
        route: tuple.item3,
      ));
      readyCompleter.completeIfNotCompleted();
    }, onError: (error) {
      _handleFailure();
    });
  }

  void _handleFailure([
    Failure? failure,
  ]) {
    if (state is! AppLoaded) {
      emit(AppState.failed(
        failure: failure,
      ));
    } else {
      emit(AppState.failed(
        failure: failure,
        hasAcceptedIntro: loadedState.hasAcceptedIntro,
        hasSignedIn: loadedState.hasSignedIn,
        route: loadedState.route,
      ));
    }
    readyCompleter.completeIfNotCompleted();
  }

  @override
  Future<void> close() {
    _streamSub.cancel();
    return super.close();
  }
}
