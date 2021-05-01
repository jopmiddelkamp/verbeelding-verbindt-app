import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/dialogs/not_implemented_dialog.dart';

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: Text('Meer info'),
      onPressed: () => showNotImplementedDialog(context),
    );
  }
}
