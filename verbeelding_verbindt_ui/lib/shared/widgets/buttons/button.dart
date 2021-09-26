import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../typedefs.dart';

abstract class Button extends HookWidget {
  const Button({
    required this.onTap,
    this.onException,
    Key? key,
  }) : super(
          key: key,
        );

  final FutureOrVoidCallback? onTap;
  final ExceptionCallback? onException;

  @protected
  Future<void> onTapInternal(
    BuildContext context,
    ValueNotifier<bool> isBusy,
  ) async {
    try {
      if (isBusy.value) {
        return;
      }
      isBusy.value = true;
      await onTap!();
      isBusy.value = false;
    } on Exception catch (e) {
      if (onException == null) {
        rethrow;
      }
      onException!(e);
    }
  }
}
