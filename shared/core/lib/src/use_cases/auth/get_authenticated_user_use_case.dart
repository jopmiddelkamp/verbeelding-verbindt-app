import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class GetAuthenticatedUserUseCase extends UseCase<Future<User?>, void> {
  GetAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<User?> call(
    void params,
  ) {
    return _authRepository.authenticatedUser;
  }
}

class StreamAuthenticatedUserUseCase extends UseCase<Stream<User?>, void> {
  StreamAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Stream<User?> call(void params) {
    return _authRepository.authenticatedUserStream;
  }
}
