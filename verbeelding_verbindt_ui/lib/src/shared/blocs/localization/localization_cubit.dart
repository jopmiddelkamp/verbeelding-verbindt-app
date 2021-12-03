import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class LocalizationCubit extends CubitBase<LocalizationState> {
  LocalizationCubit({
    required GetActiveLocaleUseCase getActiveLocaleUseCase,
    required SetActiveLocaleUseCase setActiveLocaleUseCase,
  })  : _getActiveLocaleUseCase = getActiveLocaleUseCase,
        _setActiveLocaleUseCase = setActiveLocaleUseCase,
        super(const LocalizationState.initializing());

  final GetActiveLocaleUseCase _getActiveLocaleUseCase;
  final SetActiveLocaleUseCase _setActiveLocaleUseCase;

  Future<void> init() async {
    final activeLocale = await _getActiveLocaleUseCase(null);
    await setLocale(activeLocale);
  }

  Future<void> setLocale(
    LocaleEntity locale,
  ) async {
    L10n.load(
      locale.isoLanguage.languageCode,
    );
    await _setActiveLocaleUseCase(SetActiveLocaleUseCaseArguments(
      locale: locale,
    ));
    emit(LocalizationState.loaded(
      locale: locale,
    ));
  }
}
