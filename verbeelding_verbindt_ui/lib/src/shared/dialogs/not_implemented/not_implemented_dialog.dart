import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _NotImplementedDialog extends StatelessWidget {
  const _NotImplementedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.dialogNotImplementedTitle,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.dialogNotImplementedContent,
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

void showNotImplementedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const _NotImplementedDialog(),
  );
}
