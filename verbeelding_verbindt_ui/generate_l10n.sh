# Not in the flutter gen folder as of a bug not being able to find the files when running app

echo "flutter gen-l10n localizations"
fvm flutter gen-l10n \
    --arb-dir lib/src/localization/translations \
    --template-arb-file nl.arb \
    --output-dir=lib/src/localization/translations/generated \
    --output-localization-file app_localizations.dart \
    --output-class AppLocalizations \
    --preferred-supported-locales=nl \
    --no-synthetic-package