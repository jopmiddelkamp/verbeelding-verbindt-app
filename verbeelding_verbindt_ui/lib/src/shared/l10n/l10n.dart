import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_ui.dart';

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
  final ConfirmDialogLocalizations confirmDialog;

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
    required this.confirmDialog,
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
      confirmDialog: ConfirmDialogLocalizations.of(context),
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
    ConfirmDialogLocalizations.delegate.load(locale);
  }
}
