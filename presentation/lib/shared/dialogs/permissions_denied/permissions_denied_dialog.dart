import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

class PermissionsDeniedDialog extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(
        (c, _) => c.l10n.permissionsDeniedDialog.title,
      ),
      content: TranslatedText(
        (c, _) => c.l10n.permissionsDeniedDialog.content,
      ),
      actions: <Widget>[
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.shared.close,
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
    builder: (context) => PermissionsDeniedDialog(),
  );
}
