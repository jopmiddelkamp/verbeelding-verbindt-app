import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'dependency_injection.dart';
import 'environment_variable.dart';
import 'global_bloc_observer.dart';
import 'src/app/app.dart';

Future<void> mainDelegate(
  Environment environment,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await initServiceLocator(
    environment,
  );
  Bloc.observer = GlobalBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  final env = GetIt.instance<EnvironmentVariables>().environment;
  if (env == Environment.prod) {
    debugPrint = (message, {wrapWidth}) {};
  }
  final appNavigatorKey = GlobalKey<NavigatorState>();
  runZonedGuarded(
    () => runApp(App.blocProvider(
      navigatorKey: appNavigatorKey,
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
