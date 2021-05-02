import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/device_info.dart';
import 'package:verbeelding_verbindt_core/entities/environment.dart';
import 'package:verbeelding_verbindt_core/entities/package_info.dart';

import '../extensions/build_context_extensions.dart';
import '../font_weight.dart';

final serviceLocator = GetIt.instance;

class DeviceInfoDialog extends StatelessWidget {
  const DeviceInfoDialog();

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        'Device Info',
      ),
      content: _getContent(context),
    );
  }

  Widget _getContent(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._environment(context),
          ..._generalContent(context),
          if (Platform.isAndroid) ..._androidContent(context),
          if (Platform.isIOS) ..._iOSContent(context),
        ],
      ),
    );
  }

  List<Widget> _generalContent(
    BuildContext context,
  ) {
    final package = serviceLocator<PackageInfoEntity>();
    return [
      ..._buildTile(
        context,
        'Package name',
        package.packageName,
      ),
      ..._buildTile(
        context,
        'Build number',
        package.buildNumber,
      ),
      ..._buildTile(
        context,
        'Version',
        package.version,
      ),
    ];
  }

  List<Widget> _iOSContent(
    BuildContext context,
  ) {
    final device = serviceLocator<IosDeviceInfoEntity>();
    return [
      ..._buildTile(
        context,
        'Physical device?',
        device.isPhysicalDevice.toString(),
      ),
      ..._buildTile(
        context,
        'Device',
        device.name,
      ),
      ..._buildTile(
        context,
        'Entity',
        device.model,
      ),
      ..._buildTile(
        context,
        'System name',
        device.systemName,
      ),
      ..._buildTile(
        context,
        'System version',
        device.systemVersion,
      )
    ];
  }

  List<Widget> _androidContent(
    BuildContext context,
  ) {
    final device = serviceLocator<AndroidDeviceInfoEntity>();
    return [
      ..._buildTile(
        context,
        'Physical device?',
        '${device.isPhysicalDevice}',
      ),
      ..._buildTile(
        context,
        'Manufacturer',
        '${device.manufacturer}',
      ),
      ..._buildTile(
        context,
        'Entity',
        '${device.model}',
      ),
      ..._buildTile(
        context,
        'Android version',
        '${device.androidVersion}',
      ),
      ..._buildTile(
        context,
        'Android SDK',
        '${device.androidSDK}',
      )
    ];
  }

  List<Widget> _environment(
    BuildContext context,
  ) {
    final environment = serviceLocator<EnvironmentEntity>();
    return [
      ..._buildTile(
        context,
        'Environment',
        environment.environment.toString(),
      ),
      ..._buildTile(
        context,
        'Build mode',
        environment.buildMode.toString(),
      ),
    ];
  }

  List<Widget> _buildTile(
    BuildContext context,
    String key,
    String value,
  ) {
    final theme = context.theme;
    return [
      Text(
        key,
        style: theme.textTheme.bodyText2!.copyWith(
          fontWeight: VVFontWeight.bold,
        ),
      ),
      Text(value),
      const SizedBox(height: 8),
    ];
  }
}

Future showDeviceInfoDialog(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (_) => DeviceInfoDialog(),
  );
}
