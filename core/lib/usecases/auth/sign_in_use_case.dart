import '../../repositories/auth_repository.dart';
import '../use_case_base.dart';

class SignInUseCase extends UseCase<void> {
  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> handle() async {
    await _authRepository.signInAnonymously();
  }
}
