import '../../../verbeelding_verbindt_core.dart';

class GetAuthenticatedUserUseCase extends UseCase<UserEntity?, void> {
  GetAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<UserEntity?> call(
    void argument,
  ) {
    return _authRepository.authenticatedUser;
  }
}
