import 'package:verbeelding_verbindt_core/usecases/auth/get_authenticated_user_use_case.dart';
import 'package:verbeelding_verbindt_core/usecases/intro/get_is_intro_accepted_use_case.dart';
import 'package:verbeelding_verbindt_core/usecases/route/get_has_users_route_use_case.dart';

import '../../../../app/../features/app/blocs/app/app_state.dart';
import '../../../../shared/blocs/cubit_base.dart';

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
    final hasAcceptedIntro = await _getIsIntroAcceptedUseCase.handle();
    final authenticatedUser = await _getAuthenticatedUserUseCase.handle();
    final hasActiveRoute = await _getHasUsersRouteUseCase.handle();
    emit(AppState.loaded(
      hasAcceptedIntro: hasAcceptedIntro,
      hasSignedIn: authenticatedUser != null,
      hasActiveRoute: hasActiveRoute,
    ));
  }
}
