import 'package:verbeelding_verbindt_core/entities/common/user.dart';

abstract class AuthRepository {
  Future<UserEntity> signInAnonymously();
  UserEntity get currentUser;
  Stream<bool> signedInStateChanged();
}
