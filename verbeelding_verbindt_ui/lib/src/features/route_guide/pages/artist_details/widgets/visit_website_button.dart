import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class ArtistDetailsPageVisitWebsiteButton extends StatelessWidget {
  const ArtistDetailsPageVisitWebsiteButton(
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
        context.l10n.pageArtistDetailsVisitWebsite,
      ),
      onTap: () {
        launch(website);
      },
    );
  }
}
