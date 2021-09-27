import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'confirm_dialog_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of ConfirmDialogLocalizations returned
/// by `ConfirmDialogLocalizations.of(context)`.
///
/// Applications need to include `ConfirmDialogLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/confirm_dialog_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ConfirmDialogLocalizations.localizationsDelegates,
///   supportedLocales: ConfirmDialogLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ConfirmDialogLocalizations.supportedLocales
/// property.
abstract class ConfirmDialogLocalizations {
  ConfirmDialogLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ConfirmDialogLocalizations of(BuildContext context) {
    return Localizations.of<ConfirmDialogLocalizations>(
        context, ConfirmDialogLocalizations)!;
  }

  static const LocalizationsDelegate<ConfirmDialogLocalizations> delegate =
      _ConfirmDialogLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('nl')];

  /// No description provided for @title.
  ///
  /// In nl, this message translates to:
  /// **'Weet u het zeker?'**
  String get title;
}

class _ConfirmDialogLocalizationsDelegate
    extends LocalizationsDelegate<ConfirmDialogLocalizations> {
  const _ConfirmDialogLocalizationsDelegate();

  @override
  Future<ConfirmDialogLocalizations> load(Locale locale) {
    return SynchronousFuture<ConfirmDialogLocalizations>(
        lookupConfirmDialogLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_ConfirmDialogLocalizationsDelegate old) => false;
}

ConfirmDialogLocalizations lookupConfirmDialogLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'nl':
      return ConfirmDialogLocalizationsNl();
  }

  throw FlutterError(
      'ConfirmDialogLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
