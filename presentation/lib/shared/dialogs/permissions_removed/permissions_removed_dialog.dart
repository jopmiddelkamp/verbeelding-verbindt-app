import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

// TODO: make private + other dialogs
class PermissionsRemovedDialog extends StatelessWidget {
  const PermissionsRemovedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.permissionsRemovedDialog.title,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.permissionsRemovedDialog.content,
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

void showPermissionsRemovedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const PermissionsRemovedDialog(),
  );
}
