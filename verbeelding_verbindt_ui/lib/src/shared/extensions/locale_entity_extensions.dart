import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension LocaleX on Locale {
  ui.Locale toLocale() {
    return ui.Locale(
      describeEnum(isoLanguage.languageCode),
      describeEnum(isoLanguage.countryCode),
    );
  }
}
