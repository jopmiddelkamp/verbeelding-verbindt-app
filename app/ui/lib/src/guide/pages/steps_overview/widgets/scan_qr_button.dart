import 'package:flutter/material.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepsOverviewPageScanQrButton extends StatelessWidget {
  const StepsOverviewPageScanQrButton({
    Key? key,
    required this.stepIndex,
  }) : super(key: key);

  final int stepIndex;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: Text(
        context.l10n.pageStepsOverviewScanQr,
      ),
      onPressed: () async => await _onPressed(
        context,
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    StepScanQrCodePage.go(
      context,
      params: StepScanQrCodeParams(
        stepIndex: stepIndex,
      ),
    );
  }
}
