import '../../verbeelding_verbindt_core.dart';

abstract class AuthRepository extends RepositoryBase {
  Future<UserEntity> signInAnonymously();
  Future<UserEntity?> get authenticatedUser;
  Stream<UserEntity?> get authenticatedUserStream;
}
