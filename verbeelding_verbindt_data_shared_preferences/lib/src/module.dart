import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data_shared_preferences.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  // Needed for the shared_preferences package
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final rxSharedPreferences = RxSharedPreferences(
    sharedPreferences,
    null, // Disable logging
  );

  return DataDependencies(
    routeRepository: SingletonAsync<RouteRepository>(
      () async => RouteRepositoryImpl(
        sharedPreferences: rxSharedPreferences,
      ),
    ),
    localeRepository: SingletonAsync<LocaleRepository>(
      () async => LocaleRepositoryImpl(
        sharedPreferences: rxSharedPreferences,
      ),
    ),
    introRepository: SingletonAsync<IntroRepository>(
      () async => IntroRepositoryImpl(
        sharedPreferences: rxSharedPreferences,
      ),
    ),
  );
}
