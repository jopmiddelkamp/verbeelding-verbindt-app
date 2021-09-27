import 'error_dialog_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class ErrorDialogLocalizationsNl extends ErrorDialogLocalizations {
  ErrorDialogLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get unknownErrorTitle => 'Onbekende foutmelding';

  @override
  String get unknownErrorMessage =>
      'Er is een onverwachte foutmelding opgetreden.';
}
