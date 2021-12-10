import '../../verbeelding_verbindt_core.dart';

abstract class AuthRepository extends RepositoryBase {
  Future<UserGeoLocation> signInAnonymously();
  Future<UserGeoLocation?> get authenticatedUser;
  Stream<UserGeoLocation?> get authenticatedUserStream;
}
