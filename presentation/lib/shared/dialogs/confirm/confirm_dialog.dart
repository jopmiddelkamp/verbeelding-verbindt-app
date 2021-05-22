import 'package:flutter/material.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';

class _ConfirmDialog extends StatelessWidget {
  _ConfirmDialog({
    this.title,
    required this.content,
  });

  final TranslatedTextCallback? title;
  final TranslatedTextCallback content;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: TranslatedText(title ?? (c, _) => c.l10n.confirmDialog.title),
      content: TranslatedText(content),
      actions: <Widget>[
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.shared.goBack,
          ),
          onPressed: () => context.navigator.pop(true),
        ),
        TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.shared.cancel,
          ),
          onPressed: context.navigator.pop,
        ),
      ],
    );
  }
}

Future<bool> showConfirmDialog(
  BuildContext context, {
  TranslatedTextCallback? title,
  required TranslatedTextCallback content,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => _ConfirmDialog(
      title: title,
      content: content,
    ),
  );
  return result ?? false;
}
