import '../../../verbeelding_verbindt_core.dart';

class GetActiveLocaleUseCase extends UseCase<LocaleGeoLocation, void> {
  GetActiveLocaleUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  static const _defaultIsoLanguage = IsoLanguageGeoLocation(
    languageCode: LanguageCode.nl,
    countryCode: CountryCode.nl,
  );

  @override
  Future<LocaleGeoLocation> call(
    void argument,
  ) async {
    final activeIsoLanguage = await _localeRepository.getActiveIsoLanguage();
    if (activeIsoLanguage == null) {
      return _getDefaultLocale();
    }
    final localeNotSupported = !localesLookup.containsKey(activeIsoLanguage);
    if (localeNotSupported) {
      throw Exception(
        'Provided ISO language ${activeIsoLanguage.isoLanguageCode} is not supported.',
      );
    }
    return localesLookup[activeIsoLanguage]!;
  }

  Future<LocaleGeoLocation> _getDefaultLocale() async {
    final locale = localesLookup[_defaultIsoLanguage];
    if (locale == null) {
      // TODO: improve with Fialure
      throw Exception("Default locale cannot be resolved.");
    }
    return locale;
  }
}
