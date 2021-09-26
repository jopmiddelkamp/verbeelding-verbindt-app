import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/use_cases/auth/sign_in_anonymously_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/locale/get_active_locale_use_case.dart';
import 'package:verbeelding_verbindt_ui/features/app/pages/app.dart';

import 'bootstrap.dart';

final serviceLocation = GetIt.instance;

Future<void> main() async {
  await _initFirebase();
  runZonedGuarded(
    () async {
      await Bootstrap.boot();
      final initialLocale =
          await serviceLocator<GetActiveLocaleUseCase>().call(null);
      // Remove when ever implementing a login page
      await serviceLocator<SignInAnonymouslyUseCase>().call(null);
      runApp(
        App.blocProvider(
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
