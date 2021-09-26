import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../typedefs.dart';
import 'button.dart';
import 'button_spinner.dart';

class SecondaryButton extends Button {
  const SecondaryButton({
    required this.label,
    this.icon,
    required FutureOrVoidCallback? onTap,
    ExceptionCallback? onException,
    Key? key,
  }) : super(
          key: key,
          onTap: onTap,
          onException: onException,
        );

  final Widget label;
  final Icon? icon;

  @override
  Widget build(
    BuildContext context,
  ) {
    final isBusy = useState(false);
    if (icon == null) {
      return OutlinedButton(
        child: !isBusy.value ? label : const ButtonSpinner(),
        onPressed: onTap != null ? () => onTapInternal(context, isBusy) : null,
      );
    }
    return OutlinedButton.icon(
      label: !isBusy.value ? label : const ButtonSpinner(),
      icon: icon!,
      onPressed: onTap != null ? () => onTapInternal(context, isBusy) : null,
    );
  }
}
