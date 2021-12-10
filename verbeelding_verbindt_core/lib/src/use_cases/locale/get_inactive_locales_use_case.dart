import '../../../verbeelding_verbindt_core.dart';

class GetInactiveLocalesUseCase extends UseCase<List<LocaleGeoLocation>, void> {
  GetInactiveLocalesUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<List<LocaleGeoLocation>> call(
    void argument,
  ) async {
    final activeIsoLanguage = await _localeRepository.getActiveIsoLanguage();
    return localesLookup.entries
        .where((entry) => entry.key != activeIsoLanguage)
        .map((entry) => entry.value)
        .toList();
  }
}
