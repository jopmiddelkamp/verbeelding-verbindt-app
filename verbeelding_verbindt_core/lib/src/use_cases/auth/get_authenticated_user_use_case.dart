import '../../../verbeelding_verbindt_core.dart';

class GetAuthenticatedUserUseCase extends UseCase<UserGeoLocation?, void> {
  GetAuthenticatedUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<UserGeoLocation?> call(
    void argument,
  ) {
    return _authRepository.authenticatedUser;
  }
}
