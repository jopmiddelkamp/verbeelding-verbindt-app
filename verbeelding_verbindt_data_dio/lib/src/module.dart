import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data_dio.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  // Needed for the shared_preferences package
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();

  return DataDependencies(
    routeGeneratorRepository: SingletonAsync<RouteGeneratorRepository>(
      () async => RouteXlRouteGeneratorRepository(
        http: dio, // Need custom
        baseUrl: environmentVariables.routeXl.baseUrl,
        username: environmentVariables.routeXl.username,
        password: environmentVariables.routeXl.password,
      ),
      dispose: (param) => param.dispose(),
    ),
  );
}
