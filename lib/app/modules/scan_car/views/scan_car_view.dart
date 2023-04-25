import 'package:camera/camera.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

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
            child: AspectRatio(
                aspectRatio: controller.cameraController!.value.aspectRatio,
                child: CameraPreview(controller.cameraController!))),
        // _getCameraOverlay(),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Container(
            height: 54,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: 200,
            child: AppButtonField(
              text: 'Wroom car'.toUpperCase(),
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
    if (controller.cameraStates == CameraStates.cameraError) {
      return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber,
              color: AppColors.primary,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text700(text: 'Ooops! somthing doesnt look right'),
            if (controller.errorMessage != null)
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text700(text: controller.errorMessage!),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: AppButtonField(
                onPressed: () {
                  controller.retry();
                },
                text: 'Retry',
              ),
            )
          ],
        ),
      );
    }
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
          child: Stack(
            alignment: Alignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Image.file(
                File(controller.licenceImage!.path),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                  // padding: EdgeInsets.all(200),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20)),
                  child:
                      RiveAnimation.asset('assets/images/vroom_animation.riv')),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
