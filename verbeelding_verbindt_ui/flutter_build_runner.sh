if [ "$1" == "build" ]
then
    fvm flutter pub run build_runner build --delete-conflicting-outputs
else
  fvm flutter pub run build_runner watch --delete-conflicting-outputs
fi
