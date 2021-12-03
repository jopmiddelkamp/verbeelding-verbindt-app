import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../../artist_details/artist_details_page.dart';
import '../bloc/bloc.dart';

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({
    required this.artist,
    Key? key,
  }) : super(key: key);

  final ArtistEntity artist;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: TranslatedText(
        (c, _) => c.l10n.guidePage.moreInfo,
      ),
      onPressed: () async => await _onPressed(
        context,
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    final result = await context.navigator.pushNamed<bool>(
      ArtistDetailsPage.routeName,
      arguments: ArtistDetailsPageArguments(
        artist: artist,
      ),
    );
    if (result == true) {
      context.cubit<GuideCubit>().next();
    }
  }
}
