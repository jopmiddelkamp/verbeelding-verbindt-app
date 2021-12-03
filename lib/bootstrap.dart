import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/entities/build_mode_enum.dart';
import 'package:verbeelding_verbindt_core/entities/device_info.dart';
import 'package:verbeelding_verbindt_core/entities/package_info.dart';
import 'package:verbeelding_verbindt_core/module.dart' as core;
import 'package:verbeelding_verbindt_data/module.dart' as data;
import 'package:verbeelding_verbindt_ui/module.dart' as pres;

import 'environment_variables.dart';

class Bootstrap {
  static Future<void> boot() async {
    final environmentVariables = EnvironmentVariables();
    serviceLocator.registerSingleton(_buildMode);
    serviceLocator.registerSingleton(environmentVariables.environment);

    /// Has to be run first in respect to [WidgetsFlutterBinding]
    await pres.Module.initialize(environmentVariables.environment);

    await _initDeviceInfo();
    await _initPackageInfo();
    await serviceLocator.allReady();

    await data.Module.initialize(
      routeXlBaseUrl: environmentVariables.routeXl.baseUrl,
      routeXlUsername: environmentVariables.routeXl.username,
      routeXlPassword: environmentVariables.routeXl.password,
    );
    await core.Module.initialize();
    await serviceLocator.allReady();
  }
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

Future<String> _initDeviceInfo() async {
  if (Platform.isIOS) {
    final deviceInfoPlugin = await DeviceInfoPlugin().iosInfo;
    final deviceInfo = IosDeviceInfoEntity(
      id: deviceInfoPlugin.identifierForVendor,
      name: deviceInfoPlugin.name,
      systemName: deviceInfoPlugin.systemName,
      systemVersion: deviceInfoPlugin.systemVersion,
      model: deviceInfoPlugin.model,
      isPhysicalDevice: deviceInfoPlugin.isPhysicalDevice,
    );
    serviceLocator.registerSingleton<DeviceInfoEntity>(deviceInfo);
    serviceLocator.registerSingleton(deviceInfo);
    return deviceInfo.id;
  }
  final deviceInfoPlugin = await DeviceInfoPlugin().androidInfo;
  final deviceInfo = AndroidDeviceInfoEntity(
    id: deviceInfoPlugin.id,
    manufacturer: deviceInfoPlugin.manufacturer,
    model: deviceInfoPlugin.model,
    androidVersion: deviceInfoPlugin.version.release,
    androidSDK: deviceInfoPlugin.version.sdkInt,
    isPhysicalDevice: deviceInfoPlugin.isPhysicalDevice,
  );
  serviceLocator.registerSingleton<DeviceInfoEntity>(deviceInfo);
  serviceLocator.registerSingleton(deviceInfo);
  return deviceInfo.id;
}

Future<void> _initPackageInfo() async {
  final packageInfoPlugin = await PackageInfo.fromPlatform();
  final packageInfo = PackageInfoEntity(
    packageName: packageInfoPlugin.packageName,
    buildNumber: packageInfoPlugin.buildNumber,
    version: packageInfoPlugin.version,
  );
  serviceLocator.registerSingleton(packageInfo);
}
