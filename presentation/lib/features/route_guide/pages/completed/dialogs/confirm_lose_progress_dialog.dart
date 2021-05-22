import 'package:flutter/material.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';

class ConfirmLoseProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Weet u het zeker?'),
      content: const Text(
          'Als u bevestigd terug te willen gaan zult u uw bewijs van afronden van de tour verliezen.'),
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

Future<bool> showConfirmLoseProgressDialog(
  BuildContext context,
) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => ConfirmLoseProgressDialog(),
  );
  return result ?? false;
}
