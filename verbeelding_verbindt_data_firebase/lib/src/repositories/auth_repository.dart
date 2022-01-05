import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<User> signInAnonymously() async {
    final result = await _firebaseAuth.signInAnonymously();
    return result.user!.toEntity();
  }

  @override
  Future<User?> get authenticatedUser async {
    return _firebaseAuth.currentUser?.toEntity();
  }

  @override
  Stream<User?> get authenticatedUserStream {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user?.toEntity())
        .asBroadcastStream();
  }
}
