import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _PermissionsDeniedDialog extends StatelessWidget {
  const _PermissionsDeniedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.dialogPermissionsDeniedTitle,
      ),
      content: Text(
        context.l10n.dialogPermissionsDeniedContent,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            context.l10n.sharedClose,
          ),
          onPressed: () {
            debugPrint('### _PermissionsDeniedDialog: navigator.pop()');
            context.navigator.pop();
          },
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
