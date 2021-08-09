import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../typedefs.dart';
import '../../dialogs/error/error_dialog.dart';

abstract class Button extends HookWidget {
  const Button({
    required this.onTap,
    required this.label,
    this.icon,
    this.onException,
    Key? key,
  }) : super(key: key);

  final Widget label;
  final FutureOrVoidCallback? onTap;
  final ExceptionCallback? onException;
  final Icon? icon;

  @protected
  Widget buildSpinner(
    ThemeData theme,
  ) {
    return SpinKitRing(
      color: theme.colorScheme.onPrimary,
      lineWidth: 2,
      size: theme.textTheme.button!.fontSize ?? 14,
    );
  }

  @protected
  Future<void> onTapInternal(
    BuildContext context,
    ValueNotifier<bool> isBusy,
  ) async {
    if (onTap == null) {
      return;
    }
    isBusy.value = true;
    try {
      await onTap!();
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (onException != null) {
        onException!(e);
      } else {
        showUnknownErrorDialog(
          context,
          exception: e,
        );
      }
    }
    isBusy.value = false;
  }
}
