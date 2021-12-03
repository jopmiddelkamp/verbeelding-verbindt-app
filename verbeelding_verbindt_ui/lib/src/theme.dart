import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verbeelding_verbindt_ui.dart';

// https://medium.com/flutter-community/themes-in-flutter-part-1-75f52f2334ea
// https://medium.com/flutter-community/themes-in-flutter-part-2-706382bc32c5
// https://medium.com/flutter-community/themes-in-flutter-part-3-71361ffdc344

ThemeData buildAppTheme(
  BuildContext context,
) {
  final colorScheme = _buildColorScheme();

  final textTheme = _buildTextTheme();

  return ThemeData(
    // TODO: Could be removed soon as the PR for the fix for the app bar is
    // already completed
    primaryColor: kPrimaryColor,
    primaryColorBrightness: Brightness.dark,

    colorScheme: colorScheme,

    scaffoldBackgroundColor: kBackgroundColor,
    cardColor: kSurfaceColor,
    dividerColor: kDividerColor,
    shadowColor: kShadowColor,

    textTheme: textTheme,
    iconTheme: const IconThemeData.fallback().copyWith(
      color: kOnSurfaceColor,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSmallBorderRadius),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kMediumBorderRadius),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kMediumBorderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: kAccentColor,
        padding: const EdgeInsets.all(20.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        primary: kOnSurfaceColor,
        padding: const EdgeInsets.all(20.0),
        side: const BorderSide(
          color: kBorderColor,
          width: 1.5,
        ),
      ),
    ),
    chipTheme: buildChipTheme(
      textTheme: textTheme,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
}

ColorScheme _buildColorScheme() {
  return ColorScheme(
    primary: kPrimaryColor,
    primaryVariant: kPrimaryColorDarker,
    secondary: kAccentColor,
    secondaryVariant: kAccentColorLighter,
    surface: kOnSurfaceColor,
    background: kBackgroundColor,
    error: kErrorColor,
    onPrimary: kOnPrimaryColor,
    onSecondary: kOnPrimaryColor,
    onSurface: kOnSurfaceColor,
    onBackground: kOnSurfaceColor,
    onError: kOnErrorColor,
    brightness: Brightness.light,
  );
}

TextTheme _buildTextTheme() {
  final textTheme = GoogleFonts.sourceSansProTextTheme();

  return textTheme.copyWith(
    // Extremely large text.
    headline1: textTheme.headline1!.copyWith(
      fontSize: 112,
    ),
    // Very, very large text. Used for the date in the dialog shown by
    // [showDatePicker].
    headline2: textTheme.headline2!.copyWith(
      fontSize: 56,
    ),
    // Very large text.
    headline3: textTheme.headline3!.copyWith(
      fontSize: 46,
    ),
    // Large text.
    headline4: textTheme.headline4!.copyWith(
      fontSize: 36,
    ),
    // Used for large text in dialogs (e.g., the month and year in the dialog
    // shown by [showDatePicker]).
    headline5: textTheme.headline5!.copyWith(
      fontSize: 26,
    ),
    // Used for the primary text in app bars and dialogs (e.g., [AppBar.title]
    // and [AlertDialog.title]).
    headline6: textTheme.headline6!.copyWith(
      fontSize: 22,
    ),
    // Used for the primary text in lists (e.g., [ListTile.title])
    subtitle1: textTheme.subtitle1!.copyWith(
      fontSize: 18,
    ),
    // For medium emphasis text that's a little smaller than [subtitle1].
    subtitle2: textTheme.subtitle2!.copyWith(
      fontSize: 16,
    ),
    // The default text style for [Material].
    bodyText2: textTheme.bodyText2!.copyWith(
      fontSize: 16,
    ),
    // Used for emphasizing text that would otherwise be [bodyText2].
    bodyText1: textTheme.bodyText1!.copyWith(
      fontSize: 16,
    ),
    // Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
    button: textTheme.button!.copyWith(
      fontWeight: VVFontWeight.bold,
      fontSize: 16,
    ),
  );
}

enum ChipType { filter, input }

ChipThemeData buildChipTheme({
  required TextTheme textTheme,
  Color? backgroundColor,
  Color? deleteIconColor,
  Color? disabledColor,
  Color? selectedColor,
  Color? secondarySelectedColor,
  Color? shadowColor,
  Color? selectedShadowColor,
  bool? showCheckmark,
  Color? checkmarkColor,
  EdgeInsetsGeometry? labelPadding,
  EdgeInsetsGeometry? padding,
  ShapeBorder? shape,
  TextStyle? labelStyle,
  TextStyle? secondaryLabelStyle,
  Brightness? brightness,
  double? elevation,
  double? pressElevation,
}) {
  backgroundColor = backgroundColor ?? kPrimaryColor;
  disabledColor = disabledColor ?? kPrimaryColor.withOpacity(0.4);
  selectedColor = selectedColor ?? kPrimaryColor;
  secondarySelectedColor = secondarySelectedColor ?? kPrimaryColor;
  padding =
      padding ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0);
  shape = shape ??
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1000.0)),
        side: BorderSide.none,
      );
  labelStyle = labelStyle ??
      buildChipThemeTextStyle(
        textTheme: textTheme,
      );
  secondaryLabelStyle = secondaryLabelStyle ??
      buildChipThemeTextStyle(
        textTheme: textTheme,
      );
  brightness = brightness ?? Brightness.light;

  return ChipThemeData(
    backgroundColor: backgroundColor,
    deleteIconColor: deleteIconColor ?? kOnPrimaryColor,
    disabledColor: disabledColor,
    selectedColor: selectedColor,
    secondarySelectedColor: secondarySelectedColor,
    shadowColor: shadowColor,
    selectedShadowColor: selectedShadowColor,
    showCheckmark: showCheckmark,
    checkmarkColor: checkmarkColor ?? kOnPrimaryColor,
    labelPadding: labelPadding ?? const EdgeInsets.fromLTRB(6, 4, 6, 4),
    padding: padding,
    shape: shape as OutlinedBorder?,
    labelStyle: labelStyle,
    secondaryLabelStyle: secondaryLabelStyle,
    brightness: brightness,
    elevation: elevation ?? 0,
    pressElevation: pressElevation ?? 0,
  );
}

TextStyle buildChipThemeTextStyle({
  TextTheme? textTheme,
  Color? color,
  double? fontSize,
}) {
  return TextStyle(
    color: color ?? kOnPrimaryColor,
    fontSize: fontSize ?? textTheme?.button?.fontSize ?? 16,
    fontWeight: VVFontWeight.semiBold,
  );
}

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
