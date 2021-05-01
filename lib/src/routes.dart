import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'features/intro/presentation/pages/intro/intro_page.dart';
import 'features/route_guide/presentation/pages/guide/guide_page.dart';
import 'features/route_guide/presentation/pages/select_interests/select_interests_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // WidgetBuilder builder;
  // bool fullscreenDialog = false;
  switch (settings.name) {
    case IntroPage.routeName:
      return IntroPage.route();
    case SelectInterestsPage.routeName:
      return SelectInterestsPage.route();
    case GuidePage.routeName:
      if (settings.arguments is! RoutePageArguments) {
        _thowInvalidArgumentException(
          GuidePage.routeName,
          settings,
          RoutePageArguments,
        );
      }
      return GuidePage.route(
        settings.arguments as RoutePageArguments,
      );
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}

void _thowInvalidArgumentException(
  String routeName,
  RouteSettings settings,
  Type expectedType,
) {
  throw Exception(
    'routeName: argument type mismatch. Arguments type is ${settings.arguments.runtimeType} but the expected type is $expectedType.',
  );
}
