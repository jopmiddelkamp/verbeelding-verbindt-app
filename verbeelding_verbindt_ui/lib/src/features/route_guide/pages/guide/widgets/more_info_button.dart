import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class GuidePageMoreInfoButton extends StatelessWidget {
  const GuidePageMoreInfoButton({
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
        (c, _) => c.l10n.pageGuideMoreInfo,
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
      context.read<GuideCubit>().next();
    }
  }
}
