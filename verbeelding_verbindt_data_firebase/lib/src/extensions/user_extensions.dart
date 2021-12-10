import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension UserExtensions on User {
  UserGeoLocation toGeoLocation() {
    return UserGeoLocation(
      id: uid,
      isAnonymous: isAnonymous,
    );
  }
}
