import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/enums/environment_enum.dart';
import 'package:verbeelding_verbindt_core/services/location_service.dart';
import 'package:verbeelding_verbindt_core/services/permission_service.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import 'global_bloc_observer.dart';
import 'shared/services/location/geo_locator/geo_locator_location_service_impl.dart';
import 'shared/services/permission/permission_handler/permission_handler_permission_service_impl.dart';
import 'shared/services/persistent_storage/shared_preferences/shared_preferences_persistent_storage_impl.dart';

final serviceLocator = GetIt.instance;

class Module {
  static Future<void> initialize(
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
    Bloc.observer = GlobalBlocObserver();

    await _initServices();
  }

  static Future<void> _initServices() async {
    final sp = await SharedPreferences.getInstance();
    serviceLocator
      ..registerSingletonAsync<LocationService>(
        () async => GlLocationServiceImpl(),
      )
      ..registerSingletonAsync<PersistentStorageService>(
        () async => SpPersistentStorageServiceImpl(
          sharedPreferences: sp,
        ),
      )
      ..registerSingletonWithDependencies<PermissionService>(
        () => PhLocationPermissionServiceImpl(
          persistentStorageService: serviceLocator(),
        ),
        dependsOn: [
          PersistentStorageService,
        ],
      );
  }
}
