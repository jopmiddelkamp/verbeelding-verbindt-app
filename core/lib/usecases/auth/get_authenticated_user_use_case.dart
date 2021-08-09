import 'package:verbeelding_verbindt_core/entities/common/user.dart';

import '../../repositories/auth_repository.dart';
import '../use_case_base.dart';

class GetAuthenticatedUserUseCase extends UseCase<UserEntity?> {
  GetAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<UserEntity?> handle() {
    return _authRepository.authenticatedUser;
  }
}
