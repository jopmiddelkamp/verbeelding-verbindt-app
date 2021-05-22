import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/common/device_info.dart';
import 'package:verbeelding_verbindt_core/entities/common/environment.dart';
import 'package:verbeelding_verbindt_core/entities/common/package_info.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../extensions/build_context_extensions.dart';
import '../../font_weight.dart';
import '../../widgets/text/translatable_text.dart';

final serviceLocator = GetIt.instance;

class DeviceInfoDialog extends StatelessWidget {
  const DeviceInfoDialog();

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
    final package = serviceLocator<PackageInfoEntity>();
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
    final device = serviceLocator<IosDeviceInfoEntity>();
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
    final device = serviceLocator<AndroidDeviceInfoEntity>();
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
    final environment = serviceLocator<EnvironmentEntity>();
    return [
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.environment,
        (_, __) => EnumUtils.getStringValue(environment.environment),
      ),
      ..._buildTile(
        context,
        (c, _) => c.l10n.deviceInfoDialog.buildName,
        (_, __) => EnumUtils.getStringValue(environment.buildMode),
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
    builder: (_) => DeviceInfoDialog(),
  );
}
