import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class _ImageDialog extends StatelessWidget {
  const _ImageDialog(
    this.imageProvider, {
    Key? key,
    required this.imageSize,
  }) : super(key: key);

  final ImageProvider imageProvider;
  final SizeGeoLocation imageSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    final scale = _getImageScale(context);
    final modalSize = _getModalSize(scale);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: modalSize.width,
        height: modalSize.height,
        child: PhotoView(
          imageProvider: imageProvider,
          backgroundDecoration: const BoxDecoration(
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
    const symmetricalPadding = PaddingSize.medium * 2;
    final maxSize = Size(
      context.mediaQuery.size.width - symmetricalPadding,
      context.mediaQuery.size.height - symmetricalPadding,
    );
    final widthFactor = maxSize.height / imageSize.height;
    final heightFactor = maxSize.width / imageSize.width;
    return widthFactor < heightFactor ? widthFactor : heightFactor;
  }
}

void showImageDialog(
  BuildContext context, {
  required ImageGeoLocation image,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return _ImageDialog(
        CachedNetworkImageProvider(
          image.url,
        ),
        imageSize: image.size,
      );
    },
  );
}
