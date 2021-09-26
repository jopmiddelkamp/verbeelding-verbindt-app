import '../entities/common/user.dart';
import 'repository_base.dart';

abstract class AuthRepository extends RepositoryBase {
  Future<UserEntity> signInAnonymously();
  Future<UserEntity?> get authenticatedUser;
  Stream<UserEntity?> get authenticatedUserStream;
}
