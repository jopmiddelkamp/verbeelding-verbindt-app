import 'package:flutter/material.dart';

import '../../../verbeelding_verbindt_ui.dart';

extension BuildContextX on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get textScaleFactor => mediaQuery.textScaleFactor;
  ThemeData get theme => Theme.of(this);
  CustomThemeData get customTheme => CustomTheme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  NavigatorState get navigator => Navigator.of(this);
  AppLocalizations get l10n => AppLocalizations.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) {
    return scaffoldMessenger.showSnackBar(
      snackBar,
    );
  }
}
