import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/entities/common/user.dart';
import 'package:verbeelding_verbindt_core/repositories/auth_repository.dart';

import 'extensions/firebase_user_extensions.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserEntity> signInAnonymously() async {
    final fUser = await _firebaseAuth.signInAnonymously();
    return fUser.user!.toEntity();
  }

  @override
  UserEntity get currentUser {
    return _firebaseAuth.currentUser!.toEntity();
  }

  @override
  Stream<bool> signedInStateChanged() {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user != null)
        .asBroadcastStream();
  }
}
