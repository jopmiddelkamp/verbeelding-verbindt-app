
echo "Running \"flutter clean\" in app..."
flutter clean

cd ui
echo "Running \"flutter clean\" in ui..."
flutter clean
cd ../../shared

cd core
echo "Running \"flutter clean\" in core..."
flutter clean
cd ..

cd data
echo "Running \"flutter clean\" in data..."
flutter clean
cd ..

cd data_firebase
echo "Running \"flutter clean\" in data_firebase..."
flutter clean
cd ..

cd data_shared_preferences
echo "Running \"flutter clean\" in data_shared_preferences..."
flutter clean
cd ..