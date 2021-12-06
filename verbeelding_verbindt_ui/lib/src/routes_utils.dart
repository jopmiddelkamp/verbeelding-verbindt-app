import 'package:flutter/material.dart';
import 'package:konami_detector/konami_detector.dart';

import '../verbeelding_verbindt_ui.dart';

MaterialPageRoute buildMaterialPageRoute<TResult>({
  required RouteSettings settings,
  required WidgetBuilder builder,
  bool fullscreenDialog = false,
}) {
  return MaterialPageRoute<TResult>(
    builder: (context) => KonamiDetector(
      codes: [
        ShowDeviceInfoKonamiCode(),
      ],
      child: builder(context),
    ),
    settings: settings,
    fullscreenDialog: fullscreenDialog,
  );
}

void checkArgument<TExpectedType>(
  String routeName,
  RouteSettings settings,
) {
  if (settings.arguments is! TExpectedType) {
    _thowInvalidArgumentException<TExpectedType>(
      routeName,
      settings,
    );
  }
}

void _thowInvalidArgumentException<TExpectedType>(
  String routeName,
  RouteSettings settings,
) {
  throw Exception(
    '$routeName: argument type mismatch. Arguments type is ${settings.arguments.runtimeType} but the expected type is $TExpectedType.',
  );
}
