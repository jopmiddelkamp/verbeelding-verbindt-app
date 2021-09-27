import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'device_info_dialog_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of DeviceInfoDialogLocalizations returned
/// by `DeviceInfoDialogLocalizations.of(context)`.
///
/// Applications need to include `DeviceInfoDialogLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/device_info_dialog_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DeviceInfoDialogLocalizations.localizationsDelegates,
///   supportedLocales: DeviceInfoDialogLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the DeviceInfoDialogLocalizations.supportedLocales
/// property.
abstract class DeviceInfoDialogLocalizations {
  DeviceInfoDialogLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DeviceInfoDialogLocalizations of(BuildContext context) {
    return Localizations.of<DeviceInfoDialogLocalizations>(
        context, DeviceInfoDialogLocalizations)!;
  }

  static const LocalizationsDelegate<DeviceInfoDialogLocalizations> delegate =
      _DeviceInfoDialogLocalizationsDelegate();

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

  /// No description provided for @androidSdk.
  ///
  /// In nl, this message translates to:
  /// **'Android SDK'**
  String get androidSdk;

  /// No description provided for @androidVersion.
  ///
  /// In nl, this message translates to:
  /// **'Android versie'**
  String get androidVersion;

  /// No description provided for @buildMode.
  ///
  /// In nl, this message translates to:
  /// **'Build nummer'**
  String get buildMode;

  /// No description provided for @buildName.
  ///
  /// In nl, this message translates to:
  /// **'Build nummer'**
  String get buildName;

  /// No description provided for @device.
  ///
  /// In nl, this message translates to:
  /// **'Apparaat'**
  String get device;

  /// No description provided for @environment.
  ///
  /// In nl, this message translates to:
  /// **'Omgeving'**
  String get environment;

  /// No description provided for @manufacturer.
  ///
  /// In nl, this message translates to:
  /// **'Fabrikant'**
  String get manufacturer;

  /// No description provided for @model.
  ///
  /// In nl, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @packageName.
  ///
  /// In nl, this message translates to:
  /// **'Pakket naam'**
  String get packageName;

  /// No description provided for @physicalDevice.
  ///
  /// In nl, this message translates to:
  /// **'Fysiek apparaat'**
  String get physicalDevice;

  /// No description provided for @systemName.
  ///
  /// In nl, this message translates to:
  /// **'Systeem naam'**
  String get systemName;

  /// No description provided for @systemVersion.
  ///
  /// In nl, this message translates to:
  /// **'Systeem versie'**
  String get systemVersion;

  /// No description provided for @title.
  ///
  /// In nl, this message translates to:
  /// **'Apparaat informatie'**
  String get title;

  /// No description provided for @version.
  ///
  /// In nl, this message translates to:
  /// **'Versie'**
  String get version;
}

class _DeviceInfoDialogLocalizationsDelegate
    extends LocalizationsDelegate<DeviceInfoDialogLocalizations> {
  const _DeviceInfoDialogLocalizationsDelegate();

  @override
  Future<DeviceInfoDialogLocalizations> load(Locale locale) {
    return SynchronousFuture<DeviceInfoDialogLocalizations>(
        lookupDeviceInfoDialogLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_DeviceInfoDialogLocalizationsDelegate old) => false;
}

DeviceInfoDialogLocalizations lookupDeviceInfoDialogLocalizations(
    Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'nl':
      return DeviceInfoDialogLocalizationsNl();
  }

  throw FlutterError(
      'DeviceInfoDialogLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
