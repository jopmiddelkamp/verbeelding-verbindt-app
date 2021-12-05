import 'dart:ui';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class LocalizationCubit extends CubitBase<LocalizationState> with OnReadyMixin {
  LocalizationCubit({
    required GetActiveLocaleUseCase getActiveLocaleUseCase,
    required SetActiveLocaleUseCase setActiveLocaleUseCase,
  })  : _getActiveLocaleUseCase = getActiveLocaleUseCase,
        _setActiveLocaleUseCase = setActiveLocaleUseCase,
        super(const LocalizationState.initializing());

  final GetActiveLocaleUseCase _getActiveLocaleUseCase;
  final SetActiveLocaleUseCase _setActiveLocaleUseCase;

  LocalizationLoaded get loadedState => state as LocalizationLoaded;

  Future<void> init() async {
    try {
      final activeLocale = await _getActiveLocaleUseCase(null);
      await setLocale(activeLocale);
    } on Failure catch (failure) {
      _handleFailure(failure);
    } on Exception {
      _handleFailure();
    } finally {
      readyCompleter.completeIfNotCompleted();
    }
  }

  Future<void> setLocale(
    LocaleEntity locale,
  ) async {
    final languageCodeString = EnumUtils.getStringValue(
      locale.isoLanguage.languageCode,
    );
    AppLocalizations.delegate.load(
      Locale(languageCodeString),
    );

    await _setActiveLocaleUseCase(SetActiveLocaleUseCaseArguments(
      locale: locale,
    ));
    emit(LocalizationState.loaded(
      locale: locale,
    ));
  }

  void _handleFailure([
    Failure? failure,
  ]) {
    if (state is! LocalizationLoaded) {
      emit(LocalizationState.failed(
        failure: failure,
      ));
    } else {
      emit(LocalizationState.failed(
        failure: failure,
        locale: loadedState.locale,
      ));
    }
  }
}
