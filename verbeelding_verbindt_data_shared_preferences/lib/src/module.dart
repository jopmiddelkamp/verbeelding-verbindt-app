import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data_shared_preferences.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  // Needed for the shared_preferences package
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  return DataDependencies(
    routeRepository: SingletonAsync<RouteRepository>(
      () async => RouteRepositoryImpl(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
    localeRepository: SingletonAsync<LocaleRepository>(
      () async => LocaleRepositoryImpl(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
    introRepository: SingletonAsync<IntroRepository>(
      () async => IntroRepositoryImpl(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
  );
}
