
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'guide_page_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of GuidePageLocalizations returned
/// by `GuidePageLocalizations.of(context)`.
///
/// Applications need to include `GuidePageLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/guide_page_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GuidePageLocalizations.localizationsDelegates,
///   supportedLocales: GuidePageLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the GuidePageLocalizations.supportedLocales
/// property.
abstract class GuidePageLocalizations {
  GuidePageLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static GuidePageLocalizations of(BuildContext context) {
    return Localizations.of<GuidePageLocalizations>(context, GuidePageLocalizations)!;
  }

  static const LocalizationsDelegate<GuidePageLocalizations> delegate = _GuidePageLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('nl')
  ];

  /// No description provided for @busyLoadingMap.
  ///
  /// In nl, this message translates to:
  /// **'Bezig met het laden van de map..'**
  String get busyLoadingMap;

  /// No description provided for @busySettingUpRoute.
  ///
  /// In nl, this message translates to:
  /// **'Bezig met opzetten van route..'**
  String get busySettingUpRoute;

  /// No description provided for @moreInfo.
  ///
  /// In nl, this message translates to:
  /// **'Meer info'**
  String get moreInfo;

  /// No description provided for @popConfirmMessage.
  ///
  /// In nl, this message translates to:
  /// **'Uw voortgang van de tour zal verloren gaan.'**
  String get popConfirmMessage;

  /// No description provided for @scanQr.
  ///
  /// In nl, this message translates to:
  /// **'Scan QR'**
  String get scanQr;

  /// No description provided for @title.
  ///
  /// In nl, this message translates to:
  /// **'Zoek de kunstenaar'**
  String get title;
}

class _GuidePageLocalizationsDelegate extends LocalizationsDelegate<GuidePageLocalizations> {
  const _GuidePageLocalizationsDelegate();

  @override
  Future<GuidePageLocalizations> load(Locale locale) {
    return SynchronousFuture<GuidePageLocalizations>(lookupGuidePageLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_GuidePageLocalizationsDelegate old) => false;
}

GuidePageLocalizations lookupGuidePageLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'nl': return GuidePageLocalizationsNl();
  }

  throw FlutterError(
    'GuidePageLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
