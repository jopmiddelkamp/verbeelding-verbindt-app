import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:verbeelding_verbindt_core/module.dart' as core;
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/module.dart' as data;
import 'package:verbeelding_verbindt_ui/module.dart' as pres;

import 'environment_variables.dart';

class Bootstrap {
  static Future<void> boot() async {
    final environmentVariables = EnvironmentVariables();
    GetIt.instance.registerSingleton(_buildMode);
    GetIt.instance.registerSingleton(environmentVariables.environment);

    /// Has to be run first in respect to [WidgetsFlutterBinding]
    await pres.Module.initialize(environmentVariables.environment);

    await _initDeviceInfo(
      environment: environmentVariables.environment,
      buildMode: _buildMode,
    );

    await GetIt.instance.allReady();

    await data.Module.initialize(
      routeXlBaseUrl: environmentVariables.routeXl.baseUrl,
      routeXlUsername: environmentVariables.routeXl.username,
      routeXlPassword: environmentVariables.routeXl.password,
    );
    await core.Module.initialize();
    await GetIt.instance.allReady();
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

Future<void> _initDeviceInfo({
  required Environment environment,
  required BuildMode buildMode,
}) async {
  final packageInfoPlugin = await PackageInfo.fromPlatform();
  final deviceInfo = DeviceInfoEntity({
    'Environment': describeEnum(environment),
    'Build mode': describeEnum(buildMode),
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
