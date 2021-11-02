cd verbeelding_verbindt_ui
./generate_l10n.sh
./flutter_build_runner.sh build
cd ..
cd verbeelding_verbindt_data
./flutter_build_runner.sh build
cd ..
