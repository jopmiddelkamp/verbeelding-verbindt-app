import 'package:verbeelding_verbindt_core/entities/common/user.dart';

import '../../repositories/auth_repository.dart';
import '../use_case_base.dart';

class StreamAuthenticatedUserUseCase extends UseCase<Stream<UserEntity?>> {
  StreamAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Stream<UserEntity?>> handle() async {
    return _authRepository.authenticatedUserStream;
  }
}
