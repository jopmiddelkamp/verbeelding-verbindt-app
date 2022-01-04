echo "Running \"flutter gen-l10n\" in verbeelding_verbindt_ui..."
flutter gen-l10n \
    --arb-dir lib/src/localization/translations \
    --template-arb-file nl.arb \
    --output-dir=lib/src/localization/translations/generated \
    --output-localization-file app_localizations.dart \
    --output-class AppLocalizations \
    --preferred-supported-locales=nl \
    --no-synthetic-package