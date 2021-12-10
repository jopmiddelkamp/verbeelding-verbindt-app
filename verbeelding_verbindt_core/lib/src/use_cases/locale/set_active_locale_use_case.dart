import '../../../verbeelding_verbindt_core.dart';

class SetActiveLocaleUseCase
    extends UseCase<void, SetActiveLocaleUseCaseArguments> {
  SetActiveLocaleUseCase({
    required this.localeRepository,
  });

  final LocaleRepository localeRepository;

  @override
  Future<void> call(
    SetActiveLocaleUseCaseArguments argument,
  ) {
    return localeRepository.setActiveIsoLanguage(
      argument.locale.isoLanguage,
    );
  }
}

class SetActiveLocaleUseCaseArguments {
  SetActiveLocaleUseCaseArguments({
    required this.locale,
  });

  final LocaleGeoLocation locale;
}
