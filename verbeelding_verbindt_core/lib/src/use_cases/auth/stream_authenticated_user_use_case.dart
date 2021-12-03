import '../../../verbeelding_verbindt_core.dart';

class StreamAuthenticatedUserUseCase
    extends UseCase<Stream<UserEntity?>, void> {
  StreamAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Stream<UserEntity?>> call(
    void argument,
  ) async {
    return _authRepository.authenticatedUserStream;
  }
}
