import '../../../entities/common/country_code_enum.dart';
import '../../../entities/common/iso_language.dart';
import '../../../entities/common/language_code_enum.dart';
import '../../../entities/common/locale.dart';

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
