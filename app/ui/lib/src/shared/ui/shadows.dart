import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../verbeelding_verbindt_ui.dart';

List<BoxShadow> createBoxShadowTop(
  CustomThemeData theme, {
  double blurRadius = 10,
  double spreadRadius = -10,
  double opacity = 0.1,
}) {
  final color = opacity == 1
      ? theme.colorScheme.shadow
      : theme.colorScheme.shadow.withOpacity(opacity);
  return [
    BoxShadow(
      color: color,
      blurRadius: blurRadius, // soften the shadow
      spreadRadius: spreadRadius, //extend the shadow
      offset: const DeltaOffset.top(15),
    ),
  ];
}
