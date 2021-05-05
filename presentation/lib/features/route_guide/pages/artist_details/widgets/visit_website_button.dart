import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/widgets/buttons/tsal_primary_button.dart';

class VisitWebsiteButton extends StatelessWidget {
  const VisitWebsiteButton(
    this.website, {
    Key? key,
  }) : super(key: key);

  final String website;

  @override
  Widget build(
    BuildContext context,
  ) {
    return VVPrimaryButton(
      label: Text('Bezoek website'),
      onTap: () {
        launch(website);
      },
    );
  }
}
