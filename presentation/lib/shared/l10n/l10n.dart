import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../features/intro/pages/intro/l10n/generated/intro_page_localizations.dart';
import '../../features/route_guide/pages/artist_details/l10n/generated/artist_details_page_localizations.dart';
import '../../features/route_guide/pages/completed/l10n/generated/completed_page_localizations.dart';
import '../../features/route_guide/pages/guide/l10n/generated/guide_page_localizations.dart';
import '../../features/route_guide/pages/scan_qr/l10n/generated/scan_qr_page_localizations.dart';
import '../../features/route_guide/pages/select_interests/l10n/generated/select_interests_page_localizations.dart';
import '../dialogs/device_info/l10n/generated/device_info_dialog_localizations.dart';
import '../dialogs/error/l10n/generated/error_dialog_localizations.dart';
import '../dialogs/not_implemented/l10n/generated/not_implemented_localizations.dart';
import '../dialogs/permissions_denied/l10n/generated/permissions_denied_localizations.dart';
import '../dialogs/permissions_removed/l10n/generated/permissions_removed_localizations.dart';
import '../dialogs/permissions_restricted/l10n/generated/permissions_restricted_localizations.dart';
import '../services/localization/localization_service.dart';
import 'generated/shared_localizations.dart';

class L10n {
  final SharedLocalizations shared;
  final IntroPageLocalizations introPage;
  final ArtistDetailsPageLocalizations artistDetailsPage;
  final GuidePageLocalizations guidePage;
  final ScanQrPageLocalizations scanQrPage;
  final SelectInterestsPageLocalizations selectInterestsPage;
  final CompletedPageLocalizations completedPage;
  final DeviceInfoDialogLocalizations deviceInfoDialog;
  final ErrorDialogLocalizations errorDialog;
  final NotImplementedDialogLocalizations notImplementedDialog;
  final PermissionsDeniedDialogLocalizations permissionsDeniedDialog;
  final PermissionsRemovedDialogLocalizations permissionsRemovedDialog;
  final PermissionsRestrictedDialogLocalizations permissionsRestrictedDialog;

  L10n({
    required this.shared,
    required this.introPage,
    required this.artistDetailsPage,
    required this.guidePage,
    required this.scanQrPage,
    required this.selectInterestsPage,
    required this.completedPage,
    required this.deviceInfoDialog,
    required this.errorDialog,
    required this.notImplementedDialog,
    required this.permissionsDeniedDialog,
    required this.permissionsRemovedDialog,
    required this.permissionsRestrictedDialog,
  });

  static L10n of(
    BuildContext context,
  ) {
    return L10n(
      // Shared
      shared: SharedLocalizations.of(context),
      // Pages
      introPage: IntroPageLocalizations.of(context),
      artistDetailsPage: ArtistDetailsPageLocalizations.of(context),
      guidePage: GuidePageLocalizations.of(context),
      scanQrPage: ScanQrPageLocalizations.of(context),
      selectInterestsPage: SelectInterestsPageLocalizations.of(context),
      completedPage: CompletedPageLocalizations.of(context),
      // Dialogs
      deviceInfoDialog: DeviceInfoDialogLocalizations.of(context),
      errorDialog: ErrorDialogLocalizations.of(context),
      notImplementedDialog: NotImplementedDialogLocalizations.of(context),
      permissionsDeniedDialog: PermissionsDeniedDialogLocalizations.of(context),
      permissionsRemovedDialog:
          PermissionsRemovedDialogLocalizations.of(context),
      permissionsRestrictedDialog:
          PermissionsRestrictedDialogLocalizations.of(context),
    );
  }

  static void load(
    LanguageCode languageCode,
  ) {
    final languageCodeString = EnumUtils.getStringValue(languageCode);
    final locale = Locale(languageCodeString);
    SharedLocalizations.delegate.load(locale);
    IntroPageLocalizations.delegate.load(locale);
    ArtistDetailsPageLocalizations.delegate.load(locale);
    GuidePageLocalizations.delegate.load(locale);
    ScanQrPageLocalizations.delegate.load(locale);
    SelectInterestsPageLocalizations.delegate.load(locale);
    CompletedPageLocalizations.delegate.load(locale);
    DeviceInfoDialogLocalizations.delegate.load(locale);
    ErrorDialogLocalizations.delegate.load(locale);
    NotImplementedDialogLocalizations.delegate.load(locale);
    PermissionsDeniedDialogLocalizations.delegate.load(locale);
    PermissionsRemovedDialogLocalizations.delegate.load(locale);
    PermissionsRestrictedDialogLocalizations.delegate.load(locale);
  }
}
