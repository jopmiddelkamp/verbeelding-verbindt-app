import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

class LocaleRepositoryImpl extends RepositoryBase implements LocaleRepository {
  LocaleRepositoryImpl({
    required RxSharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const activeLocaleKey = 'activeLocale';

  final RxSharedPreferences _prefs;

  @override
  Stream<IsoLanguage?> streamActiveIsoLanguage() {
    return _prefs
        .getStringStream(activeLocaleKey)
        .asyncMap(_mapActiveIsoLanguage);
  }

  @override
  Future<IsoLanguage?> getActiveIsoLanguage() async {
    final isoLanguageCode = await _prefs.getString(
      activeLocaleKey,
    );
    return await _mapActiveIsoLanguage(isoLanguageCode);
  }

  Future<IsoLanguage?> _mapActiveIsoLanguage(isoLanguageCode) async {
    if (isoLanguageCode == null) {
      return null;
    }
    try {
      return IsoLanguage.fromIsoLanguageCode(isoLanguageCode);
    } on Exception {
      await _prefs.remove(
        activeLocaleKey,
      );
      return null;
    }
  }

  @override
  Future<void> setActiveIsoLanguage(
    IsoLanguage isoLanguage,
  ) async {
    final current = await getActiveIsoLanguage();
    if (isoLanguage == current) {
      return;
    }
    return _prefs.setString(
      activeLocaleKey,
      isoLanguage.isoLanguageCode,
    );
  }
}
