import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/enums/environment_enum.dart';
import 'package:verbeelding_verbindt_presentation/app/app.dart';

import 'bootstrap.dart';

final serviceLocation = GetIt.instance;

Future<void> mainDelegate(
  Environment environment,
) async {
  await _initFlutter(environment);

  await Bootstrap.boot(environment);

  runZonedGuarded(
    () => runApp(App.blocProvider(
      navigatorKey: GlobalKey<NavigatorState>(),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future _initFlutter(
  Environment environment,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  if (environment == Environment.prod) {
    debugPrint = (message, {wrapWidth}) {};
  }
}
