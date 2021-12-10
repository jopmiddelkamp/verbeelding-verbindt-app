import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class LocaleGeoLocation extends Equatable {
  final IsoLanguageGeoLocation isoLanguage;
  final String languageName;
  final String nativeLanguageName;
  final String flagName;

  const LocaleGeoLocation({
    required this.isoLanguage,
    required this.languageName,
    required this.nativeLanguageName,
    required this.flagName,
  });

  @override
  List<Object?> get props => [
        isoLanguage,
        languageName,
        nativeLanguageName,
        flagName,
      ];
}
