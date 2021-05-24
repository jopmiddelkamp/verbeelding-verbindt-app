import 'package:flutter/material.dart';

import '../entities/common/locale.dart';
import '../enums/language_code_enum.dart';

abstract class LocalizationService {
  @protected
  final defaultLanguageCode = LanguageCode.nl;

  Stream<LocaleEntity> get locale;

  LocaleEntity get currentLocale;

  // Methods
  LocaleEntity getLocale(
    LanguageCode languageCode,
  );

  List<LocaleEntity> getLocales({
    required LanguageCode excludeLanguageCode,
  });

  Future<void> setLocale(
    LanguageCode languageCode,
  );

  @protected
  final Map<LanguageCode, LocaleEntity> locales = {
    LanguageCode.nl: LocaleEntity('nl', 'Dutch', 'Nederlands', 'nl'),
  };
}
