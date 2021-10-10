FVM=$(which fvm)
if [ -z "$FVM" ]
then
  echo "fvm not found"
  flutter clean && flutter pub get

  cd verbeelding_verbindt_core
  flutter clean && flutter pub get
  cd ..

  cd verbeelding_verbindt_data
  flutter clean && flutter pub get
  cd ..

  cd verbeelding_verbindt_ui
  flutter clean && flutter pub get
  cd ..
else
  echo "fvm found"
  fvm flutter clean && fvm flutter pub get

  cd verbeelding_verbindt_core
  fvm flutter clean && fvm flutter pub get
  cd ..

  cd verbeelding_verbindt_data
  fvm flutter clean && fvm flutter pub get
  cd ..

  cd verbeelding_verbindt_ui
  fvm flutter clean && fvm flutter pub get
  cd ..
fi