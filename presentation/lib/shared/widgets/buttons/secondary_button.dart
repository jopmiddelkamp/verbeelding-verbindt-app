import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../typedefs.dart';
import '../../extensions/build_context_extensions.dart';
import 'button.dart';
import 'button_cubit.dart';
import 'button_state.dart';

class SecondaryButton extends Button {
  const SecondaryButton._({
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
      create: (_) {
        return ButtonCubit();
      },
      child: SecondaryButton._(
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
    return BlocBuilder<ButtonCubit, ButtonState>(
      buildWhen: (previous, current) {
        return previous.busy != current.busy;
      },
      builder: (context, state) {
        if (icon == null) {
          return OutlinedButton(
            child: !state.busy ? label : buildSpinner(context.theme),
            onPressed: onTap != null ? () => onTapInternal(context) : null,
          );
        }
        return OutlinedButton.icon(
          label: !state.busy ? label : buildSpinner(context.theme),
          icon: icon!,
          onPressed: onTap != null ? () => onTapInternal(context) : null,
        );
      },
    );
  }
}
