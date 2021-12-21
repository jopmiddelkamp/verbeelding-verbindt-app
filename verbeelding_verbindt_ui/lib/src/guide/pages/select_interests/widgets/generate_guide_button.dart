import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class SelectInterestsPageGenerateGuideButton extends StatelessWidget {
  const SelectInterestsPageGenerateGuideButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SelectedInterestsCubit, SelectedInterestsState>(
      builder: (context, state) {
        return PrimaryButton(
          label: Text(
            context.l10n.pageSelectInterestsGenerateGuide,
          ),
          onTap: state is SelectedInterestsLoaded && state.hasSelection
              ? context.read<SelectedInterestsCubit>().generateGuide
              : null,
        );
      },
    );
  }
}
