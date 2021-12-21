import 'dart:async';
import 'dart:ui' as ui;

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class LocalizationCubit extends CubitBase<LocalizationState> with ReadyMixin {
  LocalizationCubit({
    required StreamActiveLocaleUseCase streamActiveLocaleUseCase,
    required SetActiveLocaleUseCase setActiveLocaleUseCase,
  })  : _streamActiveLocale = streamActiveLocaleUseCase,
        _setActiveLocale = setActiveLocaleUseCase,
        super(const LocalizationState.initializing());

  final StreamActiveLocaleUseCase _streamActiveLocale;
  final SetActiveLocaleUseCase _setActiveLocale;

  LocalizationLoaded get loadedState => state as LocalizationLoaded;

  late StreamSubscription _streamSub;

  Future<void> init() async {
    _streamSub = _streamActiveLocale(null).listen((activeLocale) async {
      await setLocale(activeLocale);
      readyCompleter.completeIfNotCompleted();
    }, onError: (_) {
      _handleFailure();
    });
  }

  Future<void> setLocale(
    Locale locale,
  ) async {
    final languageCodeString = EnumUtils.getStringValue(
      locale.isoLanguage.languageCode,
    );
    AppLocalizations.delegate.load(
      ui.Locale(languageCodeString),
    );

    await _setActiveLocale(SetActiveLocaleUseCaseParams(
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
    readyCompleter.completeIfNotCompleted();
  }

  @override
  Future<void> close() {
    _streamSub.cancel();
    return super.close();
  }
}
