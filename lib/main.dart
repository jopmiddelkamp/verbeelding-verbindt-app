import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_ui/verbeelding_verbindt_ui.dart';

import 'bootstrap.dart';

Future<void> main() async {
  await _initFirebase();
  runZonedGuarded(
    () async {
      await Bootstrap.boot();
      final initialLocale =
          await GetIt.instance<GetActiveLocaleUseCase>().call(null);
      // Remove when ever implementing a login page
      await GetIt.instance<SignInAnonymouslyUseCase>().call(null);
      runApp(
        App.bloc(
          initialLocale: initialLocale,
        ),
      );
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
      );
    },
  );
}

Future<void> _initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}
