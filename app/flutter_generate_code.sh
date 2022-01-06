cd ui
./flutter_generate_l10n.sh
./flutter_build_runner.sh build
cd ..

cd ../shared

cd data
./flutter_build_runner.sh build
cd ..

cd data_firebase
./flutter_build_runner.sh build
cd ..
