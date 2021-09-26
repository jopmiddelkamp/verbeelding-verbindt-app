cd verbeelding_verbindt_ui
./generate_l10n.sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
cd ..
