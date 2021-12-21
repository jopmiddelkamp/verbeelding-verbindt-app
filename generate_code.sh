cd verbeelding_verbindt_ui
./generate_l10n.sh
./flutter_build_runner.sh build
cd ..
cd verbeelding_verbindt_data_dio
./flutter_build_runner.sh build
cd ..

cd verbeelding_verbindt_data_firebase
./flutter_build_runner.sh build
cd ..

cd verbeelding_verbindt_data_shared_preferences
./flutter_build_runner.sh build
cd ..
