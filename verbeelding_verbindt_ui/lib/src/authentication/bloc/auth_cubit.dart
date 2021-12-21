import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class AuthCubit extends CubitBase<AuthState> {
  AuthCubit({
    required StreamAuthenticatedUserUseCase streamAuthenticatedUserUseCase,
  })  : _streamAuthenticatedUser = streamAuthenticatedUserUseCase,
        super(const AuthState.initializing());

  final StreamAuthenticatedUserUseCase _streamAuthenticatedUser;

  Future<void> init() async {
    final authenticatedUserStream = _streamAuthenticatedUser(null);
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
