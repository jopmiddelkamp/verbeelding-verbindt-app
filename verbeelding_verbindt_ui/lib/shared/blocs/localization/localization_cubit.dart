import 'package:verbeelding_verbindt_core/entities/common/locale.dart';
import 'package:verbeelding_verbindt_core/use_cases/locale/get_active_locale_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/locale/set_active_locale_use_case.dart';

import '../../l10n/l10n.dart';
import '../cubit_base.dart';
import 'bloc.dart';

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
