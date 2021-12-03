import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

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
