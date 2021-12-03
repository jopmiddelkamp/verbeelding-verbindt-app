import '../../../entities/country_code_enum.dart';
import '../../../entities/iso_language.dart';
import '../../../entities/language_code_enum.dart';
import '../../../entities/locale.dart';

final Map<IsoLanguageEntity, LocaleEntity> localesLookup = {
  const IsoLanguageEntity(
    languageCode: LanguageCode.nl,
    countryCode: CountryCode.nl,
  ): const LocaleEntity(
    isoLanguage: IsoLanguageEntity(
      languageCode: LanguageCode.nl,
      countryCode: CountryCode.nl,
    ),
    languageName: 'Dutch',
    nativeLanguageName: 'Nederlands',
    flagName: 'nl',
  ),
};
