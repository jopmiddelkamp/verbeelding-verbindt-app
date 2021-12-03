import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class SelectInterestsPageContinueButton extends StatelessWidget {
  const SelectInterestsPageContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SelectedInterestsCubit, SelectedInterestsState>(
      builder: (context, state) {
        return PrimaryButton(
          label: TranslatedText(
            (c, _) => c.l10n.sharedContinuee,
          ),
          onTap: state is SelectedInterestsLoaded && state.hasSelection
              ? () => _onTap(
                    context,
                    state: state,
                  )
              : null,
        );
      },
    );
  }

  static Future<void> _onTap(
    BuildContext context, {
    required SelectedInterestsLoaded state,
  }) async {
    context.cubit<SelectedInterestsCubit>().reset();
    await context.navigator.pushNamed(
      GuidePage.routeName,
      arguments: CreateRouteGuidePageArguments(
        selectedSpecialityIds:
            state.selectedSpecialities.map((s) => s.id!).toList(),
      ),
    );
  }
}
