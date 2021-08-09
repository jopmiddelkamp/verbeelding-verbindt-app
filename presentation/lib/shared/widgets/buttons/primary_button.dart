import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../typedefs.dart';
import '../../blocs/button/button_cubit.dart';
import '../../extensions/build_context_extensions.dart';
import 'button.dart';

class PrimaryButton extends Button {
  const PrimaryButton._({
    required FutureOrVoidCallback? onTap,
    required Widget label,
    Icon? icon,
    ExceptionCallback? onException,
  }) : super(
          onTap: onTap,
          label: label,
          icon: icon,
          onException: onException,
        );

  static Widget blocProvider({
    required FutureOrVoidCallback? onTap,
    required Widget label,
    Icon? icon,
    ExceptionCallback? onException,
  }) {
    return BlocProvider(
      create: (_) => ButtonCubit(),
      child: PrimaryButton._(
        onTap: onTap,
        label: label,
        icon: icon,
        onException: onException,
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final isBusy = useState(false);
    if (icon == null) {
      return ElevatedButton(
        child: !isBusy.value ? label : buildSpinner(context.theme),
        onPressed: onTap != null ? () => onTapInternal(context, isBusy) : null,
      );
    }
    return ElevatedButton.icon(
      label: !isBusy.value ? label : buildSpinner(context.theme),
      icon: icon!,
      onPressed: onTap != null ? () => onTapInternal(context, isBusy) : null,
    );
  }
}
