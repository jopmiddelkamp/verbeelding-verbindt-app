import '../../verbeelding_verbindt_core.dart';

abstract class AuthRepository {
  Future<User> signInAnonymously();
  Future<User?> get authenticatedUser;
  Stream<User?> get authenticatedUserStream;
}
