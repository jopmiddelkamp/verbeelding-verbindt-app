import 'package:flutter/material.dart';

MaterialPageRoute buildMaterialPageRoute<TResult>({
  required RouteSettings settings,
  required WidgetBuilder builder,
  bool fullscreenDialog = false,
}) {
  return MaterialPageRoute<TResult>(
    builder: builder,
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
