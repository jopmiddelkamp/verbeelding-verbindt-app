import 'package:verbeelding_verbindt_core/use_cases/auth/get_authenticated_user_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/intro/get_is_intro_accepted_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/get_has_users_route_use_case.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'app_state.dart';

class AppCubit extends CubitBase<AppState> {
  AppCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required GetAuthenticatedUserUseCase getAuthenticatedUserUseCase,
    required GetHasUsersRouteUseCase getHasUsersRouteUseCase,
  })  : _getIsIntroAcceptedUseCase = getIsIntroAcceptedUseCase,
        _getAuthenticatedUserUseCase = getAuthenticatedUserUseCase,
        _getHasUsersRouteUseCase = getHasUsersRouteUseCase,
        super(const AppState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAcceptedUseCase;
  final GetAuthenticatedUserUseCase _getAuthenticatedUserUseCase;
  final GetHasUsersRouteUseCase _getHasUsersRouteUseCase;

  Future<void> init() async {
    final hasAcceptedIntro = await _getIsIntroAcceptedUseCase(null);
    final authenticatedUser = await _getAuthenticatedUserUseCase(null);
    final hasActiveRoute = await _getHasUsersRouteUseCase(null);
    emit(AppState.loaded(
      hasAcceptedIntro: hasAcceptedIntro,
      hasSignedIn: authenticatedUser != null,
      hasActiveRoute: hasActiveRoute,
    ));
  }
}
