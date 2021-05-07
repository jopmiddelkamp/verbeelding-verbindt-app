import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/common/image.dart';

import '../../../../../shared/widgets/images/image_with_blurhash.dart';
import '../../../../../theme.sizes.dart';

class ImageList extends StatelessWidget {
  const ImageList(
    this.images, {
    Key? key,
    required this.padding,
  }) : super(key: key);

  final List<ImageEntity> images;
  final EdgeInsets padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      padding: padding,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: kDefaultPadding,
        mainAxisSpacing: kDefaultPadding,
        childAspectRatio: 1.5,
      ),
      itemCount: images.length,
      itemBuilder: (_, index) {
        return ImageWithBlurhash(
          images[index],
          width: 30,
          height: 20,
          borderRadius: kSmallBorderRadius,
        );
      },
    );
  }
}
