import 'package:flutter/material.dart';

import '../verbeelding_verbindt_ui.dart';

// TODO: Move into a shadow widget with named constructors
BoxDecoration getTopShadowBoxDecoration(
  BuildContext context,
) {
  return BoxDecoration(
    color: context.theme.colorScheme.background,
    boxShadow: [
      BoxShadow(
        color: context.theme.shadowColor,
        blurRadius: 10.0, // soften the shadow
        spreadRadius: 5.0, //extend the shadow
        offset: const Offset(
          15.0, // Move to right 10  horizontally
          15.0, // Move to bottom 10 Vertically
        ),
      ),
    ],
  );
}
