import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../features/intro/pages/intro/l10n/generated/intro_page_localizations.dart';
import '../../features/route_guide/pages/artist_details/l10n/generated/artist_details_page_localizations.dart';
import '../../features/route_guide/pages/completed/l10n/generated/completed_page_localizations.dart';
import '../../features/route_guide/pages/guide/l10n/generated/guide_page_localizations.dart';
import '../../features/route_guide/pages/scan_qr/l10n/generated/scan_qr_page_localizations.dart';
import '../../features/route_guide/pages/select_interests/l10n/generated/select_interests_page_localizations.dart';
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

  L10n({
    required this.shared,
    required this.introPage,
    required this.artistDetailsPage,
    required this.guidePage,
    required this.scanQrPage,
    required this.selectInterestsPage,
    required this.completedPage,
  });

  static L10n of(
    BuildContext context,
  ) {
    return L10n(
      shared: SharedLocalizations.of(context),
      introPage: IntroPageLocalizations.of(context),
      artistDetailsPage: ArtistDetailsPageLocalizations.of(context),
      guidePage: GuidePageLocalizations.of(context),
      scanQrPage: ScanQrPageLocalizations.of(context),
      selectInterestsPage: SelectInterestsPageLocalizations.of(context),
      completedPage: CompletedPageLocalizations.of(context),
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
  }
}
