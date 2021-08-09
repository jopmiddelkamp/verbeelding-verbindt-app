import '../../entities/common/locale.dart';
import '../../repositories/locale_repository.dart';
import '../use_case_base.dart';

class SetActiveLocaleUseCase
    extends UseCaseWithArgument<void, SetActiveLocaleUseCaseArguments> {
  SetActiveLocaleUseCase({
    required this.localeRepository,
  });

  final LocaleRepository localeRepository;

  @override
  Future<void> handle(
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

  final LocaleEntity locale;
}
