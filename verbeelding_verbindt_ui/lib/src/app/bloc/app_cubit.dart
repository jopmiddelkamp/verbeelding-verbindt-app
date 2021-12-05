import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class AppCubit extends CubitBase<AppState> with OnReadyMixin {
  AppCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required GetAuthenticatedUserUseCase getAuthenticatedUserUseCase,
    required GetUsersRouteUseCase getUsersRouteUseCase,
  })  : _getIsIntroAcceptedUseCase = getIsIntroAcceptedUseCase,
        _getAuthenticatedUserUseCase = getAuthenticatedUserUseCase,
        _getUsersRouteUseCase = getUsersRouteUseCase,
        super(const AppState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAcceptedUseCase;
  final GetAuthenticatedUserUseCase _getAuthenticatedUserUseCase;
  final GetUsersRouteUseCase _getUsersRouteUseCase;

  AppLoaded get loadedState => state as AppLoaded;

  Future<void> init() async {
    try {
      final hasAcceptedIntro = await _getIsIntroAcceptedUseCase(null);
      final authenticatedUser = await _getAuthenticatedUserUseCase(null);
      final route = await _getUsersRouteUseCase(null);
      emit(AppState.loaded(
        hasAcceptedIntro: hasAcceptedIntro,
        hasSignedIn: authenticatedUser != null,
        route: route,
      ));
    } on Failure catch (failure) {
      _handleFailure(failure);
    } on Exception {
      _handleFailure();
    } finally {
      readyCompleter.completeIfNotCompleted();
    }
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
  }
}
