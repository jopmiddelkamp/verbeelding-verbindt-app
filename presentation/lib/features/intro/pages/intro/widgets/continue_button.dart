import 'package:flutter/material.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/buttons/tsal_primary_button.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../intro_cubit.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
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

  VVPrimaryButton _buildButton(BuildContext context) {
    final introBloc = context.blocProvider<IntroCubit>();
    return VVPrimaryButton(
      label: TranslatedText(
        (c, _) => c.l10n.shared.continuee,
      ),
      onTap: introBloc.accept,
    );
  }
}
