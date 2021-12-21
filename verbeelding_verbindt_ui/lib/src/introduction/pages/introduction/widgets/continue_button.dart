import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroductionPageContinueButton extends StatelessWidget {
  const IntroductionPageContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final introBloc = context.read<IntroductionCubit>();
    return PrimaryButton(
      label: Text(
        context.l10n.sharedContinue,
      ),
      onTap: introBloc.accept,
    );
  }
}
