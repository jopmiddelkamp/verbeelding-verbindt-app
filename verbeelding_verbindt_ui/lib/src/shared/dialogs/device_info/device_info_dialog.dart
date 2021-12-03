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
      title: TranslatedText(
        (c, _) => c.l10n.deviceInfoDialog.title,
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
        (c, _) => c.l10n.deviceInfoDialog.packageName,
        (_, __) => package.packageName,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.buildName,
        (_, __) => package.buildNumber,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.version,
        (_, __) => package.version,
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
        (c, _) => c.l10n.deviceInfoDialog.physicalDevice,
        (_, __) {
          return device.isPhysicalDevice.toString();
        },
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.device,
        (_, __) => device.name,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.model,
        (_, __) => device.model,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.systemName,
        (_, __) => device.systemName,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.systemVersion,
        (_, __) => device.systemVersion,
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
        (c, _) => c.l10n.deviceInfoDialog.physicalDevice,
        _getTranslation(device.isPhysicalDevice),
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.manufacturer,
        (_, __) => device.manufacturer,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.model,
        (_, __) => device.model,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.androidVersion,
        (_, __) => device.androidVersion,
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.androidSdk,
        (_, __) => device.androidSDK.toString(),
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
        (c, _) => c.l10n.deviceInfoDialog.environment,
        (_, __) => EnumUtils.getStringValue(environment),
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.buildName,
        (_, __) => EnumUtils.getStringValue(buildMode),
      ),
    ];
  }

  List<Widget> _buildTile(
    BuildContext context,
    TranslatedTextCallback key,
    TranslatedTextCallback value,
  ) {
    final theme = context.theme;
    return [
      TranslatedText(
        key,
        style: theme.textTheme.bodyText2!.copyWith(
          fontWeight: VVFontWeight.bold,
        ),
      ),
      TranslatedText(value),
      const SizedBox(height: 8),
    ];
  }

  TranslatedTextCallback _getTranslation(
    bool value,
  ) {
    return (c, _) {
      if (value) {
        return c.l10n.shared.yes;
      }
      return c.l10n.shared.no;
    };
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
