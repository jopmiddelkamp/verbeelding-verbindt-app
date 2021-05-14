import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/common/image.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/font_weight.dart';
import '../../../../../shared/widgets/images/image_with_blurhash.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final ImageEntity image;
  final Widget title;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        children: [
          ImageWithBlurhash(
            image,
            width: context.mediaQuery.size.width,
            height: context.mediaQuery.size.height,
            openOnTap: false,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: DefaultTextStyle(
              style: context.textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: VVFontWeight.bold,
              ),
              child: title,
            ),
          ),
        ],
      ),
    );
  }
}
