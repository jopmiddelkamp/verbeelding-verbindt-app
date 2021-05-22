import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

class NotImplementedDialog extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.notImplementedDialog.title,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.notImplementedDialog.content,
      ),
      actions: <Widget>[
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.notImplementedDialog.close,
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
    builder: (context) => NotImplementedDialog(),
  );
}
