import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

const kDefaultAnimationDuration = Duration(milliseconds: 300);

class CustomTheme extends InheritedTheme {
  const CustomTheme({
    this.data,
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  final CustomThemeData? data;

  static CustomThemeData of(
    BuildContext context,
  ) {
    return _getInheritedCustomThemeData(context).resolve(context).copyWith(
          // Otherwise the theme will run out of sync. Need to find out why?..
          materialTheme: Theme.of(context),
        );
  }

  static CustomThemeData _getInheritedCustomThemeData(
    BuildContext context,
  ) {
    final scope = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    return scope?.data ?? CustomThemeData();
  }

  @override
  bool updateShouldNotify(CustomTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(
    BuildContext context,
    Widget child,
  ) {
    return CustomTheme(
      data: data,
      child: child,
    );
  }

  @override
  void debugFillProperties(
    DiagnosticPropertiesBuilder properties,
  ) {
    super.debugFillProperties(properties);
    data?.debugFillProperties(properties);
  }
}
