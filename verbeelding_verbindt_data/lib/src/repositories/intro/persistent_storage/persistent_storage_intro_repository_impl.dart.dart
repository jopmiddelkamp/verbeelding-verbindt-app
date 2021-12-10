import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class PersistentStorageIntroRepositoryImpl extends IntroRepository {
  PersistentStorageIntroRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const acceptedKey = 'introAccepted';

  final SharedPreferences _prefs;

  @override
  Future<void> setIntroAccepted({
    required bool value,
  }) {
    return _prefs.setBool(
      acceptedKey,
      value,
    );
  }

  @override
  Future<bool> getIntroAccepted() async {
    return _prefs.getBool(
          acceptedKey,
        ) ??
        false;
  }
}
