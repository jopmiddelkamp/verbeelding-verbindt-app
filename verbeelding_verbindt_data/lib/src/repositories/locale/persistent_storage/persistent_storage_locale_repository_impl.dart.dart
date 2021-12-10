import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class PersistentStorageLocaleRepositoryImpl extends LocaleRepository {
  PersistentStorageLocaleRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const activeLocaleKey = 'activeLocale';

  final SharedPreferences _prefs;

  @override
  Future<IsoLanguageEntity?> getActiveIsoLanguage() async {
    final isoLanguageCode = _prefs.getString(
      activeLocaleKey,
    );
    if (isoLanguageCode == null) {
      return null;
    }
    try {
      return IsoLanguageEntity.fromIsoLanguageCode(isoLanguageCode);
    } on Exception {
      await _prefs.remove(
        activeLocaleKey,
      );
      return null;
    }
  }

  @override
  Future<void> setActiveIsoLanguage(
    IsoLanguageEntity isoLanguage,
  ) {
    return _prefs.setString(
      activeLocaleKey,
      isoLanguage.isoLanguageCode,
    );
  }
}
