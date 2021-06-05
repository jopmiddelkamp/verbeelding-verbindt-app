import 'guide_page_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class GuidePageLocalizationsNl extends GuidePageLocalizations {
  GuidePageLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get busyLoadingMap => 'Bezig met het laden van de map..';

  @override
  String get busySettingUpRoute => 'Bezig met opzetten van route..';

  @override
  String get moreInfo => 'Meer info';

  @override
  String get popConfirmMessage => 'Uw voortgang van de tour zal verloren gaan.';

  @override
  String get scanQr => 'Scan QR';

  @override
  String get title => 'Zoek de kunstenaar';
}
