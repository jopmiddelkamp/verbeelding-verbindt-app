cd bootstrap
flutter clean && flutter pub get
cd ../core
flutter clean && flutter pub get
cd ../data
flutter clean && flutter pub get
cd ../presentation
flutter clean && flutter pub get && ./gen_l10n.sh
cd ..