import 'package:flutter/material.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroductionPageHeader extends StatelessWidget {
  const IntroductionPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned.fill(
            child: Image.asset(
              Package.assets.introHeader,
              package: Package.name,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              context.l10n.pageIntroTitle,
              style: context.textTheme.headline4!.copyWith(
                color: Colors.white,
                fontWeight: VVFontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
