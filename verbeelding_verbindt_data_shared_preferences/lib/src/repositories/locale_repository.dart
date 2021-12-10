import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class LocaleRepositoryImpl extends LocaleRepository {
  LocaleRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const activeLocaleKey = 'activeLocale';

  final SharedPreferences _prefs;

  @override
  Future<IsoLanguageGeoLocation?> getActiveIsoLanguage() async {
    final isoLanguageCode = _prefs.getString(
      activeLocaleKey,
    );
    if (isoLanguageCode == null) {
      return null;
    }
    try {
      return IsoLanguageGeoLocation.fromIsoLanguageCode(isoLanguageCode);
    } on Exception {
      await _prefs.remove(
        activeLocaleKey,
      );
      return null;
    }
  }

  @override
  Future<void> setActiveIsoLanguage(
    IsoLanguageGeoLocation isoLanguage,
  ) {
    return _prefs.setString(
      activeLocaleKey,
      isoLanguage.isoLanguageCode,
    );
  }
}
