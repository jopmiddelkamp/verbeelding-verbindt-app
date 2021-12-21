import 'package:flutter/material.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepsOverviewPageMoreInfoButton extends StatelessWidget {
  const StepsOverviewPageMoreInfoButton({
    required this.stepIndex,
    Key? key,
  }) : super(key: key);

  final int stepIndex;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: Text(
        context.l10n.pageStepsOverviewMoreInfo,
      ),
      onPressed: () async => await _onPressed(
        context,
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    StepDetailsPage.go(
      context,
      params: StepDetailsParams(
        index: stepIndex,
      ),
    );
  }
}
