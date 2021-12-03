import '../../../verbeelding_verbindt_core.dart';

class GetInactiveLocalesUseCase extends UseCase<List<LocaleEntity>, void> {
  GetInactiveLocalesUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<List<LocaleEntity>> call(
    void argument,
  ) async {
    final activeIsoLanguage = await _localeRepository.getActiveIsoLanguage();
    return localesLookup.entries
        .where((entry) => entry.key != activeIsoLanguage)
        .map((entry) => entry.value)
        .toList();
  }
}
