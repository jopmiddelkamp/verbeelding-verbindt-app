import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomThemeColorScheme extends ColorScheme with Diagnosticable {
  const CustomThemeColorScheme({
    required Brightness brightness,
    required Color primary,
    required this.primaryDarker,
    required Color primaryVariant,
    required Color secondary,
    required this.secondaryLighter,
    required Color secondaryVariant,
    required Color surface,
    required Color background,
    required this.backgroundDarker,
    required Color error,
    required Color onPrimary,
    required Color onSecondary,
    required Color onSurface,
    required this.onSurfaceLighter,
    required Color onBackground,
    required Color onError,
    required this.border,
    required this.divider,
    required this.shadow,
    required this.severe,
    required this.onSevere,
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
    required this.info,
    required this.onInfo,
  }) : super(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onSurface: onSurface,
          onBackground: onBackground,
          onError: onError,
          brightness: brightness,
        );

  final Color primaryDarker;
  final Color secondaryLighter;
  final Color backgroundDarker;
  final Color onSurfaceLighter;
  final Color border;
  final Color divider;
  final Color shadow;

  final Color severe;
  final Color onSevere;
  final Color warning;
  final Color onWarning;
  final Color success;
  final Color onSuccess;
  final Color info;
  final Color onInfo;

  @override
  CustomThemeColorScheme copyWith({
    Brightness? brightness,
    Color? primary,
    Color? primaryDarker,
    Color? primaryVariant,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryVariant,
    Color? secondaryLighter,
    Color? onSecondary,
    Color? background,
    Color? backgroundDarker,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceLighter,
    Color? border,
    Color? divider,
    Color? shadow,
    Color? error,
    Color? onError,
    Color? severe,
    Color? onSevere,
    Color? warning,
    Color? onWarning,
    Color? success,
    Color? onSuccess,
    Color? info,
    Color? onInfo,
  }) {
    return CustomThemeColorScheme(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      primaryDarker: primaryDarker ?? this.primaryDarker,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      secondaryLighter: secondaryLighter ?? this.secondaryLighter,
      onSecondary: onSecondary ?? this.onSecondary,
      background: background ?? this.background,
      backgroundDarker: backgroundDarker ?? this.backgroundDarker,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceLighter: onSurfaceLighter ?? this.onSurfaceLighter,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      severe: severe ?? this.severe,
      onSevere: onSevere ?? this.onSevere,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
    );
  }

  @override
  void debugFillProperties(
    DiagnosticPropertiesBuilder properties,
  ) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty(
      'primaryDarker',
      primaryDarker,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'secondaryLighter',
      secondaryLighter,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'backgroundDarker',
      backgroundDarker,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'onSurfaceLighter',
      onSurfaceLighter,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'border',
      border,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'divider',
      divider,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'shadow',
      shadow,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'severe',
      severe,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'onSevere',
      onSevere,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'warning',
      warning,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'onWarning',
      onWarning,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'success',
      success,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'onSuccess',
      onSuccess,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'info',
      info,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'onInfo',
      onInfo,
      defaultValue: null,
    ));
  }
}

// Can be moved to a seperate file so it can be replaced by a tenant specific
// file in the CD pipeline.
const kDefaultThemeColorSchemeLight = CustomThemeColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(255, 152, 0, 1),
  primaryDarker: Color.fromRGBO(245, 124, 0, 1),
  primaryVariant: Color.fromRGBO(255, 152, 0, 1),
  onPrimary: Color.fromRGBO(255, 255, 255, 1),
  secondary: Color.fromRGBO(2, 119, 189, 1),
  secondaryLighter: Color.fromRGBO(227, 243, 255, 1),
  secondaryVariant: Color.fromRGBO(2, 119, 189, 1),
  onSecondary: Color.fromRGBO(255, 255, 255, 1),
  background: Color.fromRGBO(255, 255, 255, 1),
  backgroundDarker: Color.fromRGBO(246, 246, 246, 1),
  onBackground: Color.fromRGBO(55, 55, 55, 1),
  surface: Color.fromRGBO(255, 255, 255, 1),
  onSurface: Color.fromRGBO(55, 55, 55, 1),
  onSurfaceLighter: Color.fromRGBO(182, 182, 182, 1),
  error: Color.fromRGBO(237, 109, 73, 1),
  onError: Color.fromRGBO(255, 255, 255, 1),
  border: Color.fromRGBO(235, 235, 235, 1),
  divider: Color.fromRGBO(235, 235, 235, 1),
  shadow: Color.fromRGBO(0, 0, 0, 1),
  severe: Color.fromRGBO(237, 109, 73, 1),
  onSevere: Color.fromRGBO(255, 255, 255, 1),
  warning: Color.fromRGBO(255, 194, 56, 1),
  onWarning: Color.fromRGBO(255, 255, 255, 1),
  success: Color.fromRGBO(93, 215, 132, 1),
  onSuccess: Color.fromRGBO(255, 255, 255, 1),
  info: Color.fromRGBO(182, 182, 182, 1),
  onInfo: Color.fromRGBO(255, 255, 255, 1),
);
