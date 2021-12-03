import 'package:flutter/material.dart';

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
    final introBloc = context.cubit<IntroCubit>();
    return PrimaryButton(
      label: TranslatedText(
        (c, _) => c.l10n.shared.continuee,
      ),
      onTap: introBloc.accept,
    );
  }
}
