import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepDetailsPageVisitWebsiteButton extends StatelessWidget {
  const StepDetailsPageVisitWebsiteButton(
    this.website, {
    Key? key,
  }) : super(key: key);

  final String website;

  @override
  Widget build(
    BuildContext context,
  ) {
    return PrimaryButton(
      label: Text(
        context.l10n.pageStepDetailsVisitWebsite,
      ),
      onTap: () {
        launch(website);
      },
    );
  }
}
