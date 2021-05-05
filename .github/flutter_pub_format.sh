cd bootstrap
flutter test --no-pub --coverage --test-randomize-ordering-seed random
cd ../core
flutter test --no-pub --coverage --test-randomize-ordering-seed random
cd ../data
flutter test --no-pub --coverage --test-randomize-ordering-seed random
cd ../presentation
flutter test --no-pub --coverage --test-randomize-ordering-seed random
