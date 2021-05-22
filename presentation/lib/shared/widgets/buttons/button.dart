import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../typedefs.dart';
import '../../dialogs/error/error_dialog.dart';
import '../../extensions/build_context_extensions.dart';
import 'button_cubit.dart';

abstract class Button extends StatelessWidget {
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
  ) async {
    if (onTap == null) {
      return;
    }
    final cubit = context.blocProvider<ButtonCubit>();
    cubit.setBusy(
      busy: true,
    );
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
    cubit.setBusy(
      busy: false,
    );
  }
}
