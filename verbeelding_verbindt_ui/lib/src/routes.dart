import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../verbeelding_verbindt_ui.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  // WidgetBuilder? builder;
  // var fullscreenDialog = false;
  final arguments = settings.arguments;
  switch (settings.name) {
    case IntroductionPage.routeName:
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => IntroductionPage.bloc(),
        fullscreenDialog: false,
      );
    case SelectInterestsPage.routeName:
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => SelectInterestsPage.bloc(),
        fullscreenDialog: false,
      );
    case GuidePage.routeName:
      if (arguments is! GuidePageArguments) {
        throw _throwInvalidArgumentException(
          GuidePage.routeName,
          settings,
          GuidePageArguments,
        );
      }
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => GuidePage.bloc(arguments),
        fullscreenDialog: true,
      );
    case ScanQrPage.routeName:
      if (arguments is! ScanQrPageArguments) {
        throw _throwInvalidArgumentException(
          ScanQrPage.routeName,
          settings,
          ScanQrPageArguments,
        );
      }
      return buildMaterialPageRoute<bool>(
        settings: settings,
        builder: (_) => ScanQrPage.bloc(arguments),
        fullscreenDialog: false,
      );
    case ArtistDetailsPage.routeName:
      if (arguments is! ArtistDetailsPageArguments) {
        throw _throwInvalidArgumentException(
          ArtistDetailsPage.routeName,
          settings,
          ArtistDetailsPageArguments,
        );
      }
      return buildMaterialPageRoute<bool>(
        settings: settings,
        builder: (_) => ArtistDetailsPage.bloc(arguments),
        fullscreenDialog: false,
      );

    case CompletedPage.routeName:
      if (arguments is! String) {
        throw _throwInvalidArgumentException(
          CompletedPage.routeName,
          settings,
          String,
        );
      }
      return buildMaterialPageRoute(
        settings: settings,
        builder: (_) => CompletedPage.bloc(),
        fullscreenDialog: false,
      );
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}

Exception _throwInvalidArgumentException(
  String routeName,
  RouteSettings settings,
  Type expectedType,
) {
  return Exception(
    'routeName: argument type mismatch. Arguments type is ${settings.arguments.runtimeType} but the expected type is $expectedType.',
  );
}
