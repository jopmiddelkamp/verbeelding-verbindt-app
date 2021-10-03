import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/entities/common/user.dart';
import 'package:verbeelding_verbindt_core/repositories/auth_repository.dart';

import 'extensions/firebase_user_extensions.dart';

class FirebaseAuthRepository extends AuthRepository {
  FirebaseAuthRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserEntity> signInAnonymously() async {
    final result = await _firebaseAuth.signInAnonymously();
    return result.user!.toEntity();
  }

  @override
  Future<UserEntity?> get authenticatedUser async {
    return _firebaseAuth.currentUser?.toEntity();
  }

  @override
  Stream<UserEntity?> get authenticatedUserStream {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user?.toEntity())
        .asBroadcastStream();
  }
}
