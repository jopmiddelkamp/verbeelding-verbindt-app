import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
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
          child: const Text('Oke'),
        )
      ],
    );
  }
}

void showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) => ErrorDialog(
      title: title,
      message: message,
    ),
  );
}

void showUnknownErrorDialog(
  BuildContext context, {
  required Exception exception,
}) {
  showErrorDialog(
    context,
    title: 'Onbekende foutmelding',
    message: 'Er is een onverwachte foutmelding opgetreden. $exception',
  );
}
