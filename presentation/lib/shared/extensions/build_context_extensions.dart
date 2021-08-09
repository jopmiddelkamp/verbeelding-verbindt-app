import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/cubit_base.dart';
import '../l10n/l10n.dart';

extension BuildContextExtensions on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  NavigatorState get navigator => Navigator.of(this);
  T provider<T>({bool listen = false}) => Provider.of<T>(
        this,
        listen: listen,
      );
  T cubit<T extends CubitBase<Object?>>({
    bool listen = false,
  }) =>
      BlocProvider.of<T>(this, listen: listen);
  L10n get l10n => L10n.of(this);
}
