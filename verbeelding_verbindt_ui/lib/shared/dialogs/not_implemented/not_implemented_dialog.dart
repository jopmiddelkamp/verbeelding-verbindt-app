import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

class _NotImplementedDialog extends StatelessWidget {
  const _NotImplementedDialog({Key? key}) : super(key: key);

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
            (c, _) => c.l10n.shared.close,
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
