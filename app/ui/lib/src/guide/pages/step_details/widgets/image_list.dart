import 'package:flutter/material.dart' hide Image;
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepDetailsPageImageList extends StatelessWidget {
  const StepDetailsPageImageList(
    this.images, {
    Key? key,
    required this.padding,
  }) : super(key: key);

  final List<Image> images;
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: PaddingSize.medium,
        mainAxisSpacing: PaddingSize.medium,
        childAspectRatio: 1.5,
      ),
      itemCount: images.length,
      itemBuilder: (_, index) {
        return ImageWithBlurhash(
          images[index],
          width: 30,
          height: 20,
          borderRadius: BorderRadiusSize.small,
        );
      },
    );
  }
}
