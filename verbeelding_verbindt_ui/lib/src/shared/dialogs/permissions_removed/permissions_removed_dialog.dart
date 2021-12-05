import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _PermissionsRemovedDialog extends StatelessWidget {
  const _PermissionsRemovedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.dialogPermissionsRemovedTitle,
      ),
      content: Text(
        context.l10n.dialogPermissionsRemovedContent,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            context.l10n.sharedClose,
          ),
          onPressed: context.navigator.pop,
        ),
      ],
    );
  }
}

void showPermissionsRemovedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const _PermissionsRemovedDialog(),
  );
}
