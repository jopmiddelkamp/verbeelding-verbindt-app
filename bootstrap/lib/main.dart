import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/entities/common/environment_enum.dart';
import 'package:verbeelding_verbindt_core/usecases/auth/sign_in_anonymously_use_case.dart';
import 'package:verbeelding_verbindt_core/usecases/locale/get_active_locale_use_case.dart';
import 'package:verbeelding_verbindt_presentation/features/app/pages/app.dart';

import 'bootstrap.dart';

final serviceLocation = GetIt.instance;

Future<void> mainDelegate(
  Environment environment,
) async {
  await _initFirebase();
  runZonedGuarded(
    () async {
      await Bootstrap.boot(environment);
      final initialLocale =
          await serviceLocator<GetActiveLocaleUseCase>().handle();
      // Remove when ever implementing a login page
      await serviceLocator<SignInAnonymouslyUseCase>().handle();
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
