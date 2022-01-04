cd verbeelding_verbindt_ui
./flutter_generate_l10n.sh
./flutter_build_runner.sh build
cd ..

cd verbeelding_verbindt_data
./flutter_build_runner.sh build
cd ..

cd verbeelding_verbindt_data_firebase
./flutter_build_runner.sh build
cd ..
