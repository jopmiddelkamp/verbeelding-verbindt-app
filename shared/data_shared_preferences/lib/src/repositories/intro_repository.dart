import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class IntroRepositoryImpl implements IntroRepository {
  IntroRepositoryImpl({
    required RxSharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const acceptedKey = 'introAccepted';

  final RxSharedPreferences _prefs;

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
    final result = await _prefs.getBool(
      acceptedKey,
    );
    return _mapIntroAcceptedResult(result);
  }

  @override
  Stream<bool> streamIntroAccepted() {
    return _prefs.getBoolStream(acceptedKey).map(_mapIntroAcceptedResult);
  }

  bool _mapIntroAcceptedResult(bool? result) => result ?? false;
}
