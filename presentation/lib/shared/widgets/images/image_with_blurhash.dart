import 'package:bitmap/bitmap.dart';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/image.dart';

import '../../../theme.colors.dart';
import '../../../theme.sizes.dart';
import '../../dialogs/image_dialog.dart';

enum ImageType { network }

class ImageWithBlurhash extends StatelessWidget {
  const ImageWithBlurhash(
    this.image, {
    Key? key,
    required this.width,
    required this.height,
  });

  final ImageEntity image;
  final double width;
  final double height;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        showImageDialog(
          context,
          image: image,
        );
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSmallBorderRadius),
          border: Border.all(color: kBorderColor),
        ),
        clipBehavior: Clip.antiAlias,
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image.url,
      placeholder: (context, url) {
        final bytes = BlurHash.decode(
          image.blurhash,
        )
            .toImage(
              width.toInt(),
              height.toInt(),
            )
            .getBytes();
        var bitmap = Bitmap.fromHeadless(
          width.toInt(),
          height.toInt(),
          bytes,
        );
        return Image.memory(
          bitmap.buildHeaded(),
          fit: BoxFit.cover,
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
