import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

class PermissionsRestrictedDialog extends StatelessWidget {
  const PermissionsRestrictedDialog({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.permissionsRestrictedDialog.title,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.permissionsRestrictedDialog.content,
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

void showPermissionsRestrictedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (_) => const PermissionsRestrictedDialog(),
  );
}
