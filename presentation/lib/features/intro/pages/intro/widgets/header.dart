import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/font_weight.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';

class Header extends StatelessWidget {
  const Header({
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
            child: TranslatedText(
              (c, _) => c.l10n.introPage.title,
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
