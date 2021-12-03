import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../verbeelding_verbindt_ui.dart';

extension BuildContextExtensions on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  NavigatorState get navigator => Navigator.of(this);
  L10n get l10n => L10n.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) {
    return scaffoldMessenger.showSnackBar(
      snackBar,
    );
  }

  T provider<T>({
    bool listen = false,
  }) {
    return Provider.of<T>(
      this,
      listen: listen,
    );
  }

  T cubit<T extends CubitBase<Object?>>({
    bool listen = false,
  }) {
    return BlocProvider.of<T>(
      this,
      listen: listen,
    );
  }
}
