import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerUtils {
  static Future<BitmapDescriptor> getMarkerIcon({
    required Future<ui.Image> Function() imageResolver,
    required Size size,
    required Color shadowColor,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    final radius = Radius.circular(size.width / 2);

    final shadowPaint = Paint()..color = shadowColor.withAlpha(100);
    const shadowWidth = 15.0;

    final borderPaint = Paint()..color = Colors.white;
    const borderWidth = 3.0;

    const imageOffset = shadowWidth + borderWidth;

    canvas
      ..drawRRect(
        // Add shadow circle
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            0.0,
            0.0,
            size.width,
            size.height,
          ),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint,
      )
      ..drawRRect(
        // Add border circle
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            shadowWidth,
            shadowWidth,
            size.width - (shadowWidth * 2),
            size.height - (shadowWidth * 2),
          ),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint,
      );

    // Oval for the image
    final oval = Rect.fromLTWH(
      imageOffset,
      imageOffset,
      size.width - (imageOffset * 2),
      size.height - (imageOffset * 2),
    );

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    final image = await imageResolver();
    paintImage(
      canvas: canvas,
      image: image,
      rect: oval,
      fit: BoxFit.fitWidth,
    );

    // Convert canvas to image
    final markerAsImage = await pictureRecorder.endRecording().toImage(
          size.width.toInt(),
          size.height.toInt(),
        );

    // Convert image to bytes
    final byteData = await markerAsImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }
}
