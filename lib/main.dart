import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart'
    as core;
import 'package:verbeelding_verbindt_data_dio/verbeelding_verbindt_data_dio.dart'
    as data_dio;
import 'package:verbeelding_verbindt_data_firebase/verbeelding_verbindt_data_firebase.dart'
    as data_firebase;
import 'package:verbeelding_verbindt_data_shared_preferences/verbeelding_verbindt_data_shared_preferences.dart'
    as data_sp;
import 'package:verbeelding_verbindt_ui/verbeelding_verbindt_ui.dart' as ui;

import 'src/src.dart';

Future<void> main() async {
  const environmentVariables = EnvironmentVariablesImpl();
  GetIt.instance.registerSingleton<core.EnvironmentVariables>(
    environmentVariables,
  );

  await _initFirebase();

  final dio = await data_dio.getDependencies(environmentVariables);
  final firebase = await data_firebase.getDependencies(environmentVariables);
  final sharedPreferences = await data_sp.getDependencies(environmentVariables);

  dio.routeGeneratorRepository.register();
  firebase.artistRepository.register();
  firebase.authRepository.register();
  firebase.specialityRepository.register();
  // firebase.routeRepository.register();
  sharedPreferences.routeRepository.register();
  sharedPreferences.localeRepository.register();
  sharedPreferences.introRepository.register();

  await GetIt.instance.allReady();

  (await core.getDependencies(environmentVariables)).registerAll();

  await GetIt.instance.allReady();

  await ui.boot(environmentVariables);
}

Future<void> _initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
