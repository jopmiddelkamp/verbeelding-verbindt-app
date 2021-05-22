import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../select_interests_cubit.dart';
import '../select_interests_state.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.blocProvider<SelectInterestsCubit>();
    return BlocBuilder<SelectInterestsCubit, SelectInterestsState>(
      buildWhen: (previous, current) {
        final previousHashCode = previous.selectedSpecialityIds.hashCode;
        final currentHashCode = current.selectedSpecialityIds.hashCode;
        return previousHashCode != currentHashCode;
      },
      builder: (context, state) {
        return PrimaryButton.blocProvider(
          label: TranslatedText(
            (c, _) => c.l10n.shared.continuee,
          ),
          onTap: state.hasSelection ? cubit.toggleSelectionConfirmation : null,
        );
      },
    );
  }
}
