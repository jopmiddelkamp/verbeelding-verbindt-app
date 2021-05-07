import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:verbeelding_verbindt_core/entities/common/image.dart';
import 'package:verbeelding_verbindt_core/entities/common/size.dart';

import '../../shared/extensions/build_context_extensions.dart';
import '../../theme.sizes.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog(
    this.imageProvider, {
    Key? key,
    required this.imageSize,
  }) : super(key: key);

  final ImageProvider imageProvider;
  final SizeEntity imageSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    final scale = _getImageScale(context);
    final modalSize = _getModalSize(scale);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: modalSize.width,
        height: modalSize.height,
        child: PhotoView(
          imageProvider: imageProvider,
          backgroundDecoration: BoxDecoration(
            color: Colors.transparent,
          ),
          initialScale: scale,
          minScale: scale,
          enableRotation: false,
          basePosition: Alignment.center,
        ),
      ),
    );
  }

  Size _getModalSize(
    double scale,
  ) {
    return Size(
      imageSize.width * scale,
      imageSize.height * scale,
    );
  }

  double _getImageScale(
    BuildContext context,
  ) {
    final maxSize = Size(
      context.mediaQuery.size.width - (2 * kDefaultPadding),
      context.mediaQuery.size.height - (2 * kDefaultPadding),
    );
    final widthFactor = maxSize.height / imageSize.height;
    final heightFactor = maxSize.width / imageSize.width;
    return widthFactor < heightFactor ? widthFactor : heightFactor;
  }
}

void showImageDialog(
  BuildContext context, {
  required ImageEntity image,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return ImageDialog(
        CachedNetworkImageProvider(
          image.url,
        ),
        imageSize: image.size,
      );
    },
  );
}
