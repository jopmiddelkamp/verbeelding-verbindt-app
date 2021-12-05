import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.error),
          const SizedBox(width: 4),
          Text(title),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            context.l10n.sharedOk,
          ),
        )
      ],
    );
  }
}

Future<void> showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) => _ErrorDialog(
      title: title,
      message: message,
    ),
  );
}

Future<void> showUnknownErrorDialog(
  BuildContext context, {
  required Exception exception,
}) {
  return showErrorDialog(
    context,
    title: context.l10n.dialogErrorUnknownErrorTitle,
    message: context.l10n.dialogErrorUnknownErrorMessage,
  );
}
