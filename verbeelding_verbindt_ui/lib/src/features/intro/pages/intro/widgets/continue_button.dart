import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroPageContinueButton extends StatelessWidget {
  const IntroPageContinueButton({
    Key? key,
    this.margin,
  }) : super(key: key);

  final EdgeInsets? margin;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (margin != null) {
      return Padding(
        padding: margin!,
        child: _buildButton(context),
      );
    }
    return _buildButton(context);
  }

  Widget _buildButton(
    BuildContext context,
  ) {
    final introBloc = context.read<IntroCubit>();
    return PrimaryButton(
      label: TranslatedText(
        (c, _) => c.l10n.sharedContinuee,
      ),
      onTap: introBloc.accept,
    );
  }
}
