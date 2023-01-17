import 'package:camera/camera.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../widgets/app_text/text_600.dart';
import '../controllers/scan_car_controller.dart';

class ScanCarView extends GetView<ScanCarController> {
  const ScanCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InsideAppBar(title: ''),
      body: GetBuilder<ScanCarController>(
        builder: (_) => _getChildrenDependOnCameraState(),
      ),
    );
  }

  Widget _getCamera() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
            width: Get.width,
            height: Get.width / controller.cameraController!.value.aspectRatio,
            child: CameraPreview(controller.cameraController!)),
        _getCameraOverlay(),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Container(
            height: 54,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: 200,
            child: AppButtonField(
              text: 'Find car',
              onPressed: () {
                controller.findCar();
              },
            ),
          ),
        ),
      ],
    );
  }

  ColorFiltered _getCameraOverlay() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8),
          BlendMode.srcOut), // This one will create the magic
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                backgroundBlendMode: BlendMode
                    .dstOut), // This one will handle background + difference out
          ),
          Positioned(
            top: Get.height / 2 - 300,
            left: Get.width / 2 - 200,
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: Get.height / 2 - 120,
            left: Get.width / 2 - 200,
            child: Container(
              height: 1,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.red, backgroundBlendMode: BlendMode.dstOut),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getChildrenDependOnCameraState() {
    if (controller.cameraStates == CameraStates.cameraStarting) {
      return Text('Loading');
    }
    if (controller.cameraStates == CameraStates.cameraStarted) {
      return _getCamera();
    }
    if (controller.cameraStates == CameraStates.cameraScanning) {
      return Container(
        width: double.infinity,
        // color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              controller.licenceImageCropped!,
              SizedBox(
                height: 20,
              ),
              Text600(
                text: 'Vrooming...',
                fontSize: 20,
              ),
              SizedBox(
                height: 30,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
