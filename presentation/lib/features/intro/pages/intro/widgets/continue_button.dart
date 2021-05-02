import 'package:flutter/material.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/buttons/tsal_primary_button.dart';
import '../intro_cubit.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final introBloc = context.blocProvider<IntroCubit>();
    return VVPrimaryButton(
      label: const Text('Ga verder'),
      onTap: introBloc.accept,
    );
  }
}
