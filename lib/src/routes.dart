import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'intro/intro_page.dart';
import 'route_planner/pages/route/route_page.dart';
import 'route_planner/pages/select_interests/select_interests_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // WidgetBuilder builder;
  // bool fullscreenDialog = false;
  switch (settings.name) {
    case IntroPage.routeName:
      return IntroPage.route();
    case SelectInterestsPage.routeName:
      return SelectInterestsPage.route();
    case RoutePage.routeName:
      if (settings.arguments is! RoutePageArguments) {
        _thowInvalidArgumentException(
          RoutePage.routeName,
          settings,
          RoutePageArguments,
        );
      }
      return RoutePage.route(
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
