import 'package:verbeelding_verbindt_core/entities/user.dart';

import '../../repositories/auth_repository.dart';
import '../use_case_base.dart';

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
