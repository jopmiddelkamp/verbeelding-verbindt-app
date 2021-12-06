import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroductionPageContinueButton extends StatelessWidget {
  const IntroductionPageContinueButton({
    Key? key,
    this.margin,
  }) : super(key: key);

  final EdgeInsets? margin;

  @override
  Widget build(
    BuildContext context,
  ) {
    var widget = _buildButton(context);
    if (margin == null) {
      widget = Padding(
        padding: margin!,
        child: _buildButton(context),
      );
    }
    return widget;
  }

  Widget _buildButton(
    BuildContext context,
  ) {
    final introBloc = context.read<IntroductionCubit>();
    return PrimaryButton(
      label: Text(
        context.l10n.sharedContinuee,
      ),
      onTap: introBloc.accept,
    );
  }
}
