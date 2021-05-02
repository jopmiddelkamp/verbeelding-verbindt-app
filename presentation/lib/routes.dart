import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:verbeelding_verbindt_presentation/features/route_guide/pages/scan_qr/scan_qr_page.dart';

import 'features/intro/pages/intro/intro_page.dart';
import 'features/route_guide/pages/guide/guide_page.dart';
import 'features/route_guide/pages/select_interests/select_interests_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // WidgetBuilder builder;
  // bool fullscreenDialog = false;
  switch (settings.name) {
    case IntroPage.routeName:
      return IntroPage.route();
    case SelectInterestsPage.routeName:
      return SelectInterestsPage.route();
    case GuidePage.routeName:
      if (settings.arguments is! GuidePageArguments) {
        _thowInvalidArgumentException(
          GuidePage.routeName,
          settings,
          GuidePageArguments,
        );
      }
      return GuidePage.route(
        settings.arguments as GuidePageArguments,
      );
    case ScanQrPage.routeName:
      if (settings.arguments is! ScanQrPageArguments) {
        _thowInvalidArgumentException(
          ScanQrPage.routeName,
          settings,
          ScanQrPageArguments,
        );
      }
      return ScanQrPage.route(
        settings.arguments as ScanQrPageArguments,
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
