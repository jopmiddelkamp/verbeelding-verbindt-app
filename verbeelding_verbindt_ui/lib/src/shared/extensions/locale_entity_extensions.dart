import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

extension LocaleEntityX on LocaleEntity {
  Locale toLocale() {
    return Locale(
      describeEnum(isoLanguage.languageCode),
      describeEnum(isoLanguage.countryCode),
    );
  }
}
