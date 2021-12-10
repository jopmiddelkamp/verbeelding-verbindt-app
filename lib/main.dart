import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart'
    as core;
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart'
    as data;
import 'package:verbeelding_verbindt_ui/verbeelding_verbindt_ui.dart' as ui;

import 'src/src.dart';

Future<void> main() async {
  const environmentVariables = EnvironmentVariablesImpl();
  GetIt.instance.registerSingleton<core.EnvironmentVariables>(
    environmentVariables,
  );

  await _initFirebase();

  final dataDependencies = await data.getDependencies(environmentVariables);
  dataDependencies.registerAll();

  await GetIt.instance.allReady();

  final dependencies = await core.getDependencies(environmentVariables);
  dependencies.registerAll();

  await GetIt.instance.allReady();

  ui.boot(environmentVariables);
}

Future<void> _initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
