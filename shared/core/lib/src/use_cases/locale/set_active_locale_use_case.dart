import '../../../verbeelding_verbindt_core.dart';

class SetActiveLocaleUseCase
    extends UseCase<Future<void>, SetActiveLocaleUseCaseParams> {
  SetActiveLocaleUseCase({
    required this.localeRepository,
  });

  final LocaleRepository localeRepository;

  @override
  Future<void> call(
    SetActiveLocaleUseCaseParams params,
  ) {
    return localeRepository.setActiveIsoLanguage(
      params.locale.isoLanguage,
    );
  }
}

class SetActiveLocaleUseCaseParams {
  SetActiveLocaleUseCaseParams({
    required this.locale,
  });

  final Locale locale;
}
