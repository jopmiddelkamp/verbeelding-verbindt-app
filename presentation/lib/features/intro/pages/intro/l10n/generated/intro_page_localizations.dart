import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'intro_page_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of IntroPageLocalizations returned
/// by `IntroPageLocalizations.of(context)`.
///
/// Applications need to include `IntroPageLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/intro_page_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: IntroPageLocalizations.localizationsDelegates,
///   supportedLocales: IntroPageLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the IntroPageLocalizations.supportedLocales
/// property.
abstract class IntroPageLocalizations {
  IntroPageLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static IntroPageLocalizations of(BuildContext context) {
    return Localizations.of<IntroPageLocalizations>(
        context, IntroPageLocalizations)!;
  }

  static const LocalizationsDelegate<IntroPageLocalizations> delegate =
      _IntroPageLocalizationsDelegate();

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

  /// No description provided for @text.
  ///
  /// In nl, this message translates to:
  /// **'Dit is de introductie text joe joe Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.\n\n##### Meer info header\nDit is de introductie text Lorem Ipsum is simply dummy text of the printing and typesetting industry. When an unknown printer took a galley of type and scrambled it to make a type specimen book.  Dit is de introductie text Lorem Ipsum is simply dummy. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n###### Rechten\nOm de app te kunnen gebruik hebben wij uw locatie gegevens nodig. Wij gebruiken uw locatie gegevens alleen om u van plaats naar plaats te begeleiden.'**
  String get text;

  /// No description provided for @title.
  ///
  /// In nl, this message translates to:
  /// **'Welkom'**
  String get title;
}

class _IntroPageLocalizationsDelegate
    extends LocalizationsDelegate<IntroPageLocalizations> {
  const _IntroPageLocalizationsDelegate();

  @override
  Future<IntroPageLocalizations> load(Locale locale) {
    return SynchronousFuture<IntroPageLocalizations>(
        _lookupIntroPageLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_IntroPageLocalizationsDelegate old) => false;
}

IntroPageLocalizations _lookupIntroPageLocalizations(Locale locale) {
// Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'nl':
      return IntroPageLocalizationsNl();
  }

  throw FlutterError(
      'IntroPageLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
