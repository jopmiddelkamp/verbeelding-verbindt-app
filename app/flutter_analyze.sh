echo "Running \"flutter analyze\" in app..."
flutter analyze .
echo "Running \"flutter analyze\" in core..."
flutter analyze ../shared/core
echo "Running \"flutter analyze\" in data..."
flutter analyze ../shared/data
echo "Running \"flutter analyze\" in data_firebase..."
flutter analyze ../shared/data_firebase
echo "Running \"flutter analyze\" in data_shared_preferences..."
flutter analyze ../shared/data_shared_preferences
echo "Running \"flutter analyze\" in ui..."
flutter analyze ui