import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/entities/common/locale.dart';

abstract class LocalizationService {
  @protected
  final defaultLanguageCode = LanguageCode.nl;

  final _dispose$ = PublishSubject<Null>();

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

  void dispose() {
    _dispose$
      ..add(null)
      ..close();
  }
}

enum LanguageCode {
  nl,
}
