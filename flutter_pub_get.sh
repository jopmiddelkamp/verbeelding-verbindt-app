FVM=$(which fvm)
if [ -z "$FVM" ]
then
  echo "fvm not found"
  flutter pub get

  cd verbeelding_verbindt_core
  flutter pub get
  cd ..

  cd verbeelding_verbindt_data
  flutter pub get
  cd ..

  cd verbeelding_verbindt_ui
  flutter pub get
  cd ..
else
  echo "fvm found"
  fvm flutter pub get

  cd verbeelding_verbindt_core
  fvm flutter pub get
  cd ..

  cd verbeelding_verbindt_data
  fvm flutter pub get
  cd ..

  cd verbeelding_verbindt_ui
  fvm flutter pub get
  cd ..
fi