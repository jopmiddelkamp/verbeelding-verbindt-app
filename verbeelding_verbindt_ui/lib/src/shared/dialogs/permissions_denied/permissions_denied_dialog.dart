import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _PermissionsDeniedDialog extends StatelessWidget {
  const _PermissionsDeniedDialog({Key? key}) : super(key: key);
  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.dialogPermissionsDeniedTitle,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.dialogPermissionsDeniedContent,
      ),
      actions: <Widget>[
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.sharedClose,
          ),
          onPressed: () async => await SystemNavigator.pop(),
        ),
      ],
    );
  }
}

void showPermissionsDeniedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const _PermissionsDeniedDialog(),
  );
}
