if [ "$1" == "build" ]
then
  echo "Running \"flutter pub run build_runner build\" in data..."
  flutter pub run build_runner build --delete-conflicting-outputs
else
  echo "Running \"flutter pub run build_runner watch\" in data..."
  flutter pub run build_runner watch --delete-conflicting-outputs
fi
