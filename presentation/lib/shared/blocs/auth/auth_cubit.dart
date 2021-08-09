import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/usecases/auth/sign_in_use_case.dart';
import 'package:verbeelding_verbindt_core/usecases/auth/stream_authenticated_user_use_case.dart';

import '../cubit_base.dart';
import 'auth_state.dart';

class AuthCubit extends CubitBase<AuthState> {
  AuthCubit({
    required StreamAuthenticatedUserUseCase streamAuthenticatedUserUseCase,
    required SignInUseCase signInUseCase,
  })  : _streamAuthenticatedUserUseCase = streamAuthenticatedUserUseCase,
        _signInUseCase = signInUseCase,
        super(const AuthState.initializing());

  final StreamAuthenticatedUserUseCase _streamAuthenticatedUserUseCase;
  final SignInUseCase _signInUseCase;

  Future<void> init() async {
    final authenticatedUserStream =
        await _streamAuthenticatedUserUseCase.handle();
    authenticatedUserStream.takeUntil(close$).listen((user) async {
      emit(AuthState.loaded(
        authenticatedUser: user,
      ));
    });
  }

  Future<void> signInAnonymously() async {
    await _signInUseCase.handle();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
