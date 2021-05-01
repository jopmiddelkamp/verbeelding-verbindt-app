import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../../../../shared/presentation/widgets/buttons/tsal_primary_button.dart';
import '../bloc/barrel.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.blocProvider<PageCubit>();
    return BlocBuilder<PageCubit, PageState>(
      buildWhen: (previous, current) {
        final previousHashCode = previous.selectedSpecialityIds.hashCode;
        final currentHashCode = current.selectedSpecialityIds.hashCode;
        return previousHashCode != currentHashCode;
      },
      builder: (context, state) {
        return VVPrimaryButton(
          label: const Text('Verder'),
          onTap: state.hasSelection ? cubit.toggleSelectionConfirmation : null,
        );
      },
    );
  }
}
