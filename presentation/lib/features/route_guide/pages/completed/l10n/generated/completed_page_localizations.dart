
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'completed_page_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of CompletedPageLocalizations returned
/// by `CompletedPageLocalizations.of(context)`.
///
/// Applications need to include `CompletedPageLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/completed_page_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CompletedPageLocalizations.localizationsDelegates,
///   supportedLocales: CompletedPageLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CompletedPageLocalizations.supportedLocales
/// property.
abstract class CompletedPageLocalizations {
  CompletedPageLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CompletedPageLocalizations of(BuildContext context) {
    return Localizations.of<CompletedPageLocalizations>(context, CompletedPageLocalizations)!;
  }

  static const LocalizationsDelegate<CompletedPageLocalizations> delegate = _CompletedPageLocalizationsDelegate();

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

  /// No description provided for @text.
  ///
  /// In nl, this message translates to:
  /// **'Dit is de introductie text joe joe Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.\n\n##### Meer info header\nDit is de introductie text Lorem Ipsum is simply dummy text of the printing and typesetting industry. When an unknown printer took a galley of type and scrambled it to make a type specimen book.  Dit is de introductie text Lorem Ipsum is simply dummy. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n###### Rechten\nOm de app te kunnen gebruik hebben wij uw locatie gegevens nodig. Wij gebruiken uw locatie gegevens alleen om u van plaats naar plaats te begeleiden.'**
  String get text;

  /// No description provided for @title.
  ///
  /// In nl, this message translates to:
  /// **'Goed gedaan!'**
  String get title;
}

class _CompletedPageLocalizationsDelegate extends LocalizationsDelegate<CompletedPageLocalizations> {
  const _CompletedPageLocalizationsDelegate();

  @override
  Future<CompletedPageLocalizations> load(Locale locale) {
    return SynchronousFuture<CompletedPageLocalizations>(_lookupCompletedPageLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_CompletedPageLocalizationsDelegate old) => false;
}

CompletedPageLocalizations _lookupCompletedPageLocalizations(Locale locale) {
  


// Lookup logic when only language code is specified.
switch (locale.languageCode) {
  case 'nl': return CompletedPageLocalizationsNl();
}


  throw FlutterError(
    'CompletedPageLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
