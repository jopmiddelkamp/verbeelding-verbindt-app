import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_ui.dart';

Future<void> boot(
  EnvironmentVariables environmentVariables,
) async {
  await _initLocalDependencies(environmentVariables);
  await GetIt.instance.allReady();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  await runZonedGuarded(
    () async => await BlocOverrides.runZoned(
      () async {
        final appCubit = AppCubit(
          getAuthenticatedUserUseCase: GetIt.instance(),
          getIsIntroAcceptedUseCase: GetIt.instance(),
          getUsersRouteUseCase: GetIt.instance(),
        )..init();

        final localizationCubit = LocalizationCubit(
          getActiveLocaleUseCase: GetIt.instance(),
          setActiveLocaleUseCase: GetIt.instance(),
        )..init();

        await localizationCubit.onReady;

        runApp(App.bloc(
          appCubit: appCubit,
          localizationCubit: localizationCubit,
        ));
      },
      blocObserver: GlobalBlocObserver(),
    ),
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
      );
    },
  );
}

Future<void> _initLocalDependencies(
  EnvironmentVariables environmentVariables,
) async {
  _initLocationService();
  await _initDeviceInfo(environmentVariables);
}

void _initLocationService() {
  GetIt.instance.registerSingleton<LocationService>(
    LocationServiceImpl(),
  );
}

Future<void> _initDeviceInfo(
  EnvironmentVariables environmentVariables,
) async {
  final packageInfoPlugin = await PackageInfo.fromPlatform();
  final deviceInfo = DeviceInfoGeoLocation({
    'Environment': environmentVariables.environment.name,
    'Build mode': _buildMode.name,
    'Package name': packageInfoPlugin.packageName,
    'Build number': packageInfoPlugin.buildNumber,
    'Version': packageInfoPlugin.version,
  });

  if (Platform.isIOS) {
    final deviceInfoPlugin = await DeviceInfoPlugin().iosInfo;
    deviceInfo.addEntries({
      'Identifier': deviceInfoPlugin.identifierForVendor,
      'Name': deviceInfoPlugin.name,
      'System name': deviceInfoPlugin.systemName,
      'System version': deviceInfoPlugin.systemVersion,
      'Model': deviceInfoPlugin.model,
      'Is physical device': deviceInfoPlugin.isPhysicalDevice.toString(),
    }.entries);
  } else if (Platform.isAndroid) {
    final deviceInfoPlugin = await DeviceInfoPlugin().androidInfo;
    deviceInfo.addEntries({
      'Identifier': deviceInfoPlugin.id,
      'Manufacturer': deviceInfoPlugin.manufacturer,
      'Model': deviceInfoPlugin.model,
      'Android version': deviceInfoPlugin.version.release,
      'Android SDK': deviceInfoPlugin.version.sdkInt.toString(),
      'Is physical device': deviceInfoPlugin.isPhysicalDevice.toString(),
    }.entries);
  }
  GetIt.instance.registerSingleton(deviceInfo);
}

BuildMode get _buildMode {
  if (kReleaseMode) {
    return BuildMode.release;
  } else if (kProfileMode) {
    return BuildMode.profile;
  } else {
    return BuildMode.debug;
  }
}
