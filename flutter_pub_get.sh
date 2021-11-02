cd verbeelding_verbindt_core
echo "cd verbeelding_verbindt_core"
fvm flutter pub get
cd ..
echo "cd .."

cd verbeelding_verbindt_data
echo "cd verbeelding_verbindt_data"
fvm flutter pub get
cd ..
echo "cd .."

cd verbeelding_verbindt_ui
echo "cd verbeelding_verbindt_ui"
fvm flutter pub get
cd ..
echo "cd .."

fvm flutter pub get