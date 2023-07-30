import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class WidgetsToImageController {
  GlobalKey containerKey = GlobalKey();

  /// to capture widget to image by GlobalKey in RenderRepaintBoundary
  Future<Uint8List?> capture() async {
    try {
      /// boundary widget by GlobalKey
      RenderRepaintBoundary? boundary = containerKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (kDebugMode && boundary!.debugNeedsPaint) {
        print("Waiting for boundary to be painted.");
        await Future.delayed(const Duration(milliseconds: 20));
        // return null;
        return capture();
      }

      /// convert boundary to image
      final image = await boundary!.toImage(pixelRatio: 6);

      /// set ImageByteFormat
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }
}
