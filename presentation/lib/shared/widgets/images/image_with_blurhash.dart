import 'package:bitmap/bitmap.dart';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:verbeelding_verbindt_core/entities/common/image.dart';

import '../../../theme.colors.dart';
import '../../dialogs/image/image_dialog.dart';

enum ImageType { network }

class ImageWithBlurhash extends StatelessWidget {
  const ImageWithBlurhash(
    this.image, {
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.openOnTap = true,
  });

  final ImageEntity image;
  final double width;
  final double height;
  final double? borderRadius;
  final bool openOnTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    BoxDecoration? boxDecoration;
    Clip? clipBehavior;
    if (borderRadius != null) {
      boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(color: kBorderColor),
      );
      clipBehavior = Clip.antiAlias;
    }

    Widget result = Container(
      height: height,
      width: width,
      decoration: boxDecoration,
      clipBehavior: clipBehavior ?? Clip.none,
      child: _buildImage(),
    );

    if (openOnTap) {
      result = GestureDetector(
        onTap: () {
          showImageDialog(
            context,
            image: image,
          );
        },
        child: result,
      );
    }

    return result;
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      fadeInDuration: 300.milliseconds,
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
