import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_data_firebase.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserGeoLocation> signInAnonymously() async {
    final result = await _firebaseAuth.signInAnonymously();
    return result.user!.toGeoLocation();
  }

  @override
  Future<UserGeoLocation?> get authenticatedUser async {
    return _firebaseAuth.currentUser?.toGeoLocation();
  }

  @override
  Stream<UserGeoLocation?> get authenticatedUserStream {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user?.toGeoLocation())
        .asBroadcastStream();
  }
}
