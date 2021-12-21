import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension UserX on firebase.User {
  User toEntity() {
    return User(
      id: uid,
      isAnonymous: isAnonymous,
    );
  }
}
