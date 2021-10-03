import 'package:verbeelding_verbindt_core/use_cases/auth/get_authenticated_user_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/intro/get_is_intro_accepted_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/get_users_route_use_case.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'app_state.dart';

class AppCubit extends CubitBase<AppState> {
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

  Future<void> init() async {
    final hasAcceptedIntro = await _getIsIntroAcceptedUseCase(null);
    final authenticatedUser = await _getAuthenticatedUserUseCase(null);
    final route = await _getUsersRouteUseCase(null);
    emit(AppState.loaded(
      hasAcceptedIntro: hasAcceptedIntro,
      hasSignedIn: authenticatedUser != null,
      route: route,
    ));
  }
}
