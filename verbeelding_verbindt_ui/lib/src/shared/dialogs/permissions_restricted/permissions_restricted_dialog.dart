import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _PermissionsRestrictedDialog extends StatelessWidget {
  const _PermissionsRestrictedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.dialogPermissionsRestrictedTitle,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.dialogPermissionsRestrictedContent,
      ),
      actions: <Widget>[
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.sharedClose,
          ),
          onPressed: context.navigator.pop,
        ),
      ],
    );
  }
}

void showPermissionsRestrictedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const _PermissionsRestrictedDialog(),
  );
}
