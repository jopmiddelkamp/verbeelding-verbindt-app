# Not in the flutter gen folder as of a bug not being able to find the files when running app

flutter gen-l10n \
    --arb-dir lib/shared/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/l10n/generated \
    --output-localization-file shared_localizations.dart \
    --output-class SharedLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/intro/pages/intro/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/intro/pages/intro/l10n/generated \
    --output-localization-file intro_page_localizations.dart \
    --output-class IntroPageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/artist_details/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/artist_details/l10n/generated \
    --output-localization-file artist_details_page_localizations.dart \
    --output-class ArtistDetailsPageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/guide/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/guide/l10n/generated \
    --output-localization-file guide_page_localizations.dart \
    --output-class GuidePageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/scan_qr/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/scan_qr/l10n/generated \
    --output-localization-file scan_qr_page_localizations.dart \
    --output-class ScanQrPageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/select_interests/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/select_interests/l10n/generated \
    --output-localization-file select_interests_page_localizations.dart \
    --output-class SelectInterestsPageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/features/route_guide/pages/completed/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/features/route_guide/pages/completed/l10n/generated \
    --output-localization-file completed_page_localizations.dart \
    --output-class CompletedPageLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/shared/dialogs/device_info/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/device_info/l10n/generated \
    --output-localization-file device_info_dialog_localizations.dart \
    --output-class DeviceInfoDialogLocalizations \
    --no-synthetic-package

flutter gen-l10n \
    --arb-dir lib/shared/dialogs/error_dialog/l10n \
    --template-arb-file nl.arb \
    --output-dir=lib/shared/dialogs/error_dialog/l10n/generated \
    --output-localization-file error_dialog_localizations.dart \
    --output-class ErrorDialogLocalizations \
    --no-synthetic-package