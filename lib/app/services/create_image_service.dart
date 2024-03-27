// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
//
// class CreateImageService extends GetxService {
//   Future<Uint8List?> createImageFromWidget(Widget widget,
//       {Duration? wait}) async {
//     widget = MediaQuery(data: new MediaQueryData(), child: widget);
//     final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
//
//     var physicalSize = new Size(
//         ui.window.physicalSize.width, ui.window.physicalSize.height + 12000);
//     var logicalSize = physicalSize / ui.window.devicePixelRatio;
//     if (Platform.isWindows) {
//       physicalSize = ui.Size(2200, 12000);
//     }
//
//     final RenderView renderView = RenderView(
//       window: WidgetsBinding.instance.window,
//       child: RenderPositionedBox(
//           alignment: Alignment.center, child: repaintBoundary),
//       configuration: ViewConfiguration(
//         size: logicalSize,
//         devicePixelRatio: 1.0,
//       ),
//     );
//
//     final PipelineOwner pipelineOwner = PipelineOwner();
//     final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
//
//     pipelineOwner.rootNode = renderView;
//     renderView.prepareInitialFrame();
//
//     final RenderObjectToWidgetElement<RenderBox> rootElement =
//         RenderObjectToWidgetAdapter<RenderBox>(
//       container: repaintBoundary,
//       child: widget,
//     ).attachToRenderTree(buildOwner);
//
//     buildOwner.buildScope(rootElement);
//
//     if (wait != null) {
//       await Future.delayed(wait);
//     }
//
//     buildOwner.buildScope(rootElement);
//     buildOwner.finalizeTree();
//
//     pipelineOwner.flushLayout();
//     pipelineOwner.flushCompositingBits();
//     pipelineOwner.flushPaint();
//
//     if (kDebugMode && repaintBoundary.debugNeedsPaint) {
//       print("Waiting for boundary to be painted.");
//       await Future.delayed(const Duration(milliseconds: 20));
//       // return null;
//       return createImageFromWidget(widget, wait: wait);
//     }
//
//     final ui.Image image = await repaintBoundary.toImage(
//         pixelRatio: physicalSize.width / logicalSize.width);
//     final ByteData? byteData =
//         await image.toByteData(format: ui.ImageByteFormat.png);
//
//     return byteData?.buffer.asUint8List();
//   }
// }
