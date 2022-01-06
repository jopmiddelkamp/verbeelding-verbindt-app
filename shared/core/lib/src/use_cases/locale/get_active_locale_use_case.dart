import '../../../verbeelding_verbindt_core.dart';

const _defaultIsoLanguage = IsoLanguage(
  languageCode: LanguageCode.nl,
  countryCode: CountryCode.nl,
);

class GetActiveLocaleUseCase extends UseCase<Future<Locale>, void> {
  GetActiveLocaleUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<Locale> call(void params) async {
    final activeIsoLanguage = await _localeRepository.getActiveIsoLanguage();
    return await _mapActiveIsoLanguage(activeIsoLanguage);
  }
}

class StreamActiveLocaleUseCase extends UseCase<Stream<Locale>, void> {
  StreamActiveLocaleUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Stream<Locale> call(void params) {
    return _localeRepository
        .streamActiveIsoLanguage()
        .asyncMap(_mapActiveIsoLanguage);
  }
}

Future<Locale> _mapActiveIsoLanguage(
  IsoLanguage? activeIsoLanguage,
) async {
  if (activeIsoLanguage == null) {
    return await _getDefaultLocale();
  }
  final localeNotSupported = !localesLookup.containsKey(activeIsoLanguage);
  if (localeNotSupported) {
    throw Exception(
      'Provided ISO language ${activeIsoLanguage.isoLanguageCode} is not supported.',
    );
  }
  return localesLookup[activeIsoLanguage]!;
}

Future<Locale> _getDefaultLocale() async {
  final locale = localesLookup[_defaultIsoLanguage];
  if (locale == null) {
    // TODO: improve with Fialure
    throw Exception("Default locale cannot be resolved.");
  }
  return locale;
}
