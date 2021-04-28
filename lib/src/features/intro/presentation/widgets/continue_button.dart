import 'package:flutter/material.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/presentation/widgets/buttons/tsal_primary_button.dart';
import '../bloc/page_cubit.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final introBloc = context.blocProvider<PageCubit>();
    return VVPrimaryButton(
      label: const Text('Ga verder'),
      onTap: introBloc.accept,
    );
  }
}
