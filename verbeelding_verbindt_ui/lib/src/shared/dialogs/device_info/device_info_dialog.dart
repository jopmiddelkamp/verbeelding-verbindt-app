import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _DeviceInfoDialog extends StatelessWidget {
  const _DeviceInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.dialogDeviceInfoTitle,
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
    final package = GetIt.instance<PackageInfoEntity>();
    return [
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoPackageName,
        package.packageName,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoBuildName,
        package.buildNumber,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoVersion,
        package.version,
      ),
    ];
  }

  List<Widget> _iOSContent(
    BuildContext context,
  ) {
    final device = GetIt.instance<IosDeviceInfoEntity>();
    return [
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoPhysicalDevice,
        device.isPhysicalDevice.toString(),
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoDevice,
        device.name,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoModel,
        device.model,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoSystemName,
        device.systemName,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoSystemVersion,
        device.systemVersion,
      )
    ];
  }

  List<Widget> _androidContent(
    BuildContext context,
  ) {
    final device = GetIt.instance<AndroidDeviceInfoEntity>();
    return [
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoPhysicalDevice,
        device.isPhysicalDevice
            ? context.l10n.sharedYes
            : context.l10n.sharedNo,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoManufacturer,
        device.manufacturer,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoModel,
        device.model,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoAndroidVersion,
        device.androidVersion,
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoAndroidSdk,
        device.androidSDK.toString(),
      )
    ];
  }

  List<Widget> _environment(
    BuildContext context,
  ) {
    final environment = GetIt.instance<Environment>();
    final buildMode = GetIt.instance<BuildMode>();
    return [
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoEnvironment,
        EnumUtils.getStringValue(environment),
      ),
      ..._buildTile(
        context,
        context.l10n.dialogDeviceInfoBuildName,
        EnumUtils.getStringValue(buildMode),
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
    builder: (_) => const _DeviceInfoDialog(),
  );
}
