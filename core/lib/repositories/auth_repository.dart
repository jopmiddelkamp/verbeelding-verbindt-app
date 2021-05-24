import '../entities/common/user.dart';
import 'repository_base.dart';

abstract class AuthRepository extends RepositoryBase {
  Future<UserEntity> signInAnonymously();
  UserEntity get currentUser;
  Stream<bool> signedInStateChanged();
}
