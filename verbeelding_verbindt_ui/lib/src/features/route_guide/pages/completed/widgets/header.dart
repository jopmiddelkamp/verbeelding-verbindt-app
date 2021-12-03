import 'package:flutter/material.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class CompletedPageHeader extends StatelessWidget {
  const CompletedPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Package.assets.unknownArtist,
              package: Package.name,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: DefaultTextStyle(
              style: context.textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: VVFontWeight.bold,
              ),
              child: TranslatedText(
                (c, _) => c.l10n.pageCompletedTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
