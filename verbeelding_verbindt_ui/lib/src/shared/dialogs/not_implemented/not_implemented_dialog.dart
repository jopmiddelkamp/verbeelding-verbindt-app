import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _NotImplementedDialog extends StatelessWidget {
  const _NotImplementedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.dialogNotImplementedTitle,
      ),
      content: Text(
        context.l10n.dialogNotImplementedContent,
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

void showNotImplementedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const _NotImplementedDialog(),
  );
}
