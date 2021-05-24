import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/entities/common/locale.dart';
import 'package:verbeelding_verbindt_core/enums/language_code_enum.dart';
import 'package:verbeelding_verbindt_core/services/localization_service.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../../l10n/l10n.dart';

class LocalizationServiceImpl extends LocalizationService {
  // Constructors
  LocalizationServiceImpl({
    required PersistentStorageService persistentStorageService,
    required LanguageCode? initialLanguageCode,
  }) : _persistentStorageService = persistentStorageService {
    _init(
      initialLanguageCode ?? defaultLanguageCode,
    );
  }

  final PersistentStorageService _persistentStorageService;

  static const languageCodeKey = 'currentLocaleLanguageCode';

  // Fields
  late final BehaviorSubject<LocaleEntity> _locale;

  Stream<LocaleEntity> get locale =>
      _locale.asBroadcastStream().startWith(_locale.value);

  LocaleEntity get currentLocale => _locale.value;

  // Methods
  void _init(
    LanguageCode initialLanguageCode,
  ) {
    final locale =
        locales[initialLanguageCode] ?? locales[defaultLanguageCode]!;
    _locale = BehaviorSubject<LocaleEntity>.seeded(locale);
    setLocale(initialLanguageCode);
  }

  LocaleEntity getLocale(
    LanguageCode languageCode,
  ) {
    return _locales[languageCode]!;
  }

  List<LocaleEntity> getLocales({
    required LanguageCode excludeLanguageCode,
  }) {
    final result = <LocaleEntity>[];
    _locales.forEach((key, value) {
      if (key != excludeLanguageCode) {
        result.add(value);
      }
    });
    return result;
  }

  Future<void> setLocale(
    LanguageCode languageCode,
  ) async {
    L10n.load(languageCode);
    _locale.add(getLocale(languageCode));
    await _persistentStorageService.setString(
      languageCodeKey,
      EnumUtils.getStringValue(languageCode),
    );
  }

  static const Map<LanguageCode, LocaleEntity> _locales = {
    LanguageCode.nl: LocaleEntity('nl', 'Dutch', 'Nederlands', 'nl'),
  };
}
