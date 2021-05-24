import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/entities/common/user.dart';

extension FirebaseUserExtensions on User {
  UserEntity toEntity() {
    return UserEntity(
      id: uid,
      isAnonymous: isAnonymous,
    );
  }
}
