
echo "Running \"flutter clean\" in verbeelding_verbindt_app..."
flutter clean

cd verbeelding_verbindt_core
echo "Running \"flutter clean\" in verbeelding_verbindt_core..."
flutter clean
cd ..

cd verbeelding_verbindt_data
echo "Running \"flutter clean\" in verbeelding_verbindt_data..."
flutter clean
cd ..

cd verbeelding_verbindt_data_firebase
echo "Running \"flutter clean\" in verbeelding_verbindt_data_firebase..."
flutter clean
cd ..

cd verbeelding_verbindt_data_shared_preferences
echo "Running \"flutter clean\" in verbeelding_verbindt_data_shared_preferences..."
flutter clean
cd ..

cd verbeelding_verbindt_ui
echo "Running \"flutter clean\" in verbeelding_verbindt_ui..."
flutter clean
cd ..