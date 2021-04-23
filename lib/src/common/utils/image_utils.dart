import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class ImageUtils {
  static Future<ui.Image> getUiImageFromUrl(
    String url, {
    Size? size,
  }) async {
    final width = size != null ? size.width.toInt() : null;
    final height = size != null ? size.height.toInt() : null;
    var image = Image(
      image: CachedNetworkImageProvider(
        url,
        maxWidth: width,
        maxHeight: height,
      ),
    );
    return await _getUiImageFromImage(image);
  }

  static Future<ui.Image> getUiImageFromAsset(
    String path,
  ) async {
    var image = Image.asset(
      path,
    );
    return await _getUiImageFromImage(image);
  }

  static Future<ui.Image> _getUiImageFromImage(
    Image image,
  ) async {
    final completer = Completer<ImageInfo>();
    image.image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((imageInfo, _) {
      if (!completer.isCompleted) {
        completer.complete(imageInfo);
      }
    }));
    final imageInfo = await completer.future;
    return imageInfo.image;
  }
}
