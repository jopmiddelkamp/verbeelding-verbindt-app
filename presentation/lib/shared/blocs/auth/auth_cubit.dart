import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/usecases/auth/stream_authenticated_user_use_case.dart';

import '../cubit_base.dart';
import 'auth_state.dart';

class AuthCubit extends CubitBase<AuthState> {
  AuthCubit({
    required StreamAuthenticatedUserUseCase streamAuthenticatedUserUseCase,
  })  : _streamAuthenticatedUserUseCase = streamAuthenticatedUserUseCase,
        super(const AuthState.initializing());

  final StreamAuthenticatedUserUseCase _streamAuthenticatedUserUseCase;

  Future<void> init() async {
    final authenticatedUserStream =
        await _streamAuthenticatedUserUseCase.handle();
    authenticatedUserStream.takeUntil(close$).listen((user) async {
      emit(AuthState.loaded(
        authenticatedUser: user,
      ));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
