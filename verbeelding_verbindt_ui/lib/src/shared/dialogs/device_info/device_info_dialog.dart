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
    final diagnostics = GetIt.instance<DeviceInfoEntity>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final entry in diagnostics.entries)
            ..._buildTile(
              context,
              entry,
            ),
        ],
      ),
    );
  }

  List<Widget> _buildTile(
    BuildContext context,
    MapEntry<String, String> entry,
  ) {
    final theme = context.theme;
    return [
      Text(
        entry.key,
        style: theme.textTheme.bodyText2!.copyWith(
          fontWeight: VVFontWeight.bold,
        ),
      ),
      Text(entry.value),
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
