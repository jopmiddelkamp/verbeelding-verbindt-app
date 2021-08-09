import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'features/intro/pages/intro/intro_page.dart';
import 'features/route_guide/pages/artist_details/artist_details_page.dart';
import 'features/route_guide/pages/completed/completed_page.dart';
import 'features/route_guide/pages/guide/guide_page.dart';
import 'features/route_guide/pages/scan_qr/scan_qr_page.dart';
import 'features/route_guide/pages/select_interests/select_interests_page.dart';
import 'routes_utils.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  // WidgetBuilder? builder;
  // var fullscreenDialog = false;
  final arguments = settings.arguments;
  switch (settings.name) {
    case IntroPage.routeName:
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => IntroPage.blocProvider(),
        fullscreenDialog: false,
      );
    case SelectInterestsPage.routeName:
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => SelectInterestsPage.blocProvider(),
        fullscreenDialog: false,
      );
    case GuidePage.routeName:
      if (arguments is GuidePageArguments) {
        return buildMaterialPageRoute(
          settings: settings,
          builder: (_) => GuidePage.blocProvider(arguments),
          fullscreenDialog: true,
        );
      }
      throw _thowInvalidArgumentException(
        GuidePage.routeName,
        settings,
        GuidePageArguments,
      );
    case ScanQrPage.routeName:
      if (arguments is ScanQrPageArguments) {
        return buildMaterialPageRoute<bool>(
          settings: settings,
          builder: (_) => ScanQrPage.blocProvider(arguments),
          fullscreenDialog: false,
        );
      }
      throw _thowInvalidArgumentException(
        ScanQrPage.routeName,
        settings,
        ScanQrPageArguments,
      );
    case ArtistDetailsPage.routeName:
      if (arguments is ArtistDetailsPageArguments) {
        return buildMaterialPageRoute<bool>(
          settings: settings,
          builder: (_) => ArtistDetailsPage.blocProvider(arguments),
          fullscreenDialog: false,
        );
      }
      throw _thowInvalidArgumentException(
        ArtistDetailsPage.routeName,
        settings,
        ArtistDetailsPageArguments,
      );
    case CompletedPage.routeName:
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => const CompletedPage(),
        fullscreenDialog: false,
      );
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}

Exception _thowInvalidArgumentException(
  String routeName,
  RouteSettings settings,
  Type expectedType,
) {
  return Exception(
    'routeName: argument type mismatch. Arguments type is ${settings.arguments.runtimeType} but the expected type is $expectedType.',
  );
}
