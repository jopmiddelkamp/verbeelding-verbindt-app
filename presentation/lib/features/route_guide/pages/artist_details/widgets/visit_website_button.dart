import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/buttons/tsal_primary_button.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';

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
      label: TranslatedText(
        (c, _) => c.l10n.artistDetailsPage.visitWebsite,
      ),
      onTap: () {
        launch(website);
      },
    );
  }
}
