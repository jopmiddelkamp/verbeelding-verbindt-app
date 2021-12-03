import 'package:equatable/equatable.dart';

import 'iso_language.dart';

class LocaleEntity extends Equatable {
  final IsoLanguageEntity isoLanguage;
  final String languageName;
  final String nativeLanguageName;
  final String flagName;

  const LocaleEntity({
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
