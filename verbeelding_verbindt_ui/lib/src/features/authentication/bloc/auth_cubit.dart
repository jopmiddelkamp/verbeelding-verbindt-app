import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class AuthCubit extends CubitBase<AuthState> {
  AuthCubit({
    required StreamAuthenticatedUserUseCase streamAuthenticatedUserUseCase,
  })  : _streamAuthenticatedUserUseCase = streamAuthenticatedUserUseCase,
        super(const AuthState.initializing());

  final StreamAuthenticatedUserUseCase _streamAuthenticatedUserUseCase;

  Future<void> init() async {
    final authenticatedUserStream = await _streamAuthenticatedUserUseCase(null);
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
