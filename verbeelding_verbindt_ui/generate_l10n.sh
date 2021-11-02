# Not in the flutter gen folder as of a bug not being able to find the files when running app

fvm flutter gen-l10n \
    --arb-dir lib/shared/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/l10n/generated \
    --output-localization-file shared_localizations.dart \
    --output-class SharedLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/intro/pages/intro/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/intro/pages/intro/l10n/generated \
    --output-localization-file intro_page_localizations.dart \
    --output-class IntroPageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/artist_details/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/artist_details/l10n/generated \
    --output-localization-file artist_details_page_localizations.dart \
    --output-class ArtistDetailsPageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/guide/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/guide/l10n/generated \
    --output-localization-file guide_page_localizations.dart \
    --output-class GuidePageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/scan_qr/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/scan_qr/l10n/generated \
    --output-localization-file scan_qr_page_localizations.dart \
    --output-class ScanQrPageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/select_interests/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/select_interests/l10n/generated \
    --output-localization-file select_interests_page_localizations.dart \
    --output-class SelectInterestsPageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/completed/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/completed/l10n/generated \
    --output-localization-file completed_page_localizations.dart \
    --output-class CompletedPageLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/device_info/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/device_info/l10n/generated \
    --output-localization-file device_info_dialog_localizations.dart \
    --output-class DeviceInfoDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/error/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/error/l10n/generated \
    --output-localization-file error_dialog_localizations.dart \
    --output-class ErrorDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/not_implemented/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/not_implemented/l10n/generated \
    --output-localization-file not_implemented_dialog_localizations.dart \
    --output-class NotImplementedDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/permissions_denied/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/permissions_denied/l10n/generated \
    --output-localization-file permissions_denied_dialog_localizations.dart \
    --output-class PermissionsDeniedDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/permissions_removed/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/permissions_removed/l10n/generated \
    --output-localization-file permissions_removed_dialog_localizations.dart \
    --output-class PermissionsRemovedDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/permissions_restricted/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/permissions_restricted/l10n/generated \
    --output-localization-file permissions_restricted_dialog_localizations.dart \
    --output-class PermissionsRestrictedDialogLocalizations \
    --no-synthetic-package \
    --verbose

fvm flutter gen-l10n \
    --arb-dir lib/shared/dialogs/confirm/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/confirm/l10n/generated \
    --output-localization-file confirm_dialog_localizations.dart \
    --output-class ConfirmDialogLocalizations \
    --no-synthetic-package \
    --verbose
