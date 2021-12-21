import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _ConfirmDialog extends StatelessWidget {
  const _ConfirmDialog({
    this.title,
    required this.content,
  });

  final String? title;
  final String content;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(title ?? context.l10n.dialogConfirmTitle),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(
            context.l10n.sharedGoBack,
          ),
          onPressed: () {
            debugPrint('### _ConfirmDialog: navigator.pop()');
            context.navigator.pop(true);
          },
        ),
        TextButton(
          child: Text(
            context.l10n.sharedCancel,
          ),
          onPressed: context.navigator.pop,
        ),
      ],
    );
  }
}

Future<bool> showConfirmDialog(
  BuildContext context, {
  String? title,
  required String content,
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
