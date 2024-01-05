import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../controllers/scan_car_controller.dart';

class ScanCarView extends GetView<ScanCarController> {
  const ScanCarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanCarController>(
      builder: (_) => Scaffold(
        body: _getChildrenDependOnCameraState(),
      ),
    );
  }

  Widget _getCamera() {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (controller.isSimulator)
          Container(
            child: Image.asset('assets/images/bmwx1.png'),
          ),
        if (!controller.isSimulator)
          Container(
              width: Get.width,
              height:
                  Get.width / controller.cameraController!.value.aspectRatio,
              child: AspectRatio(
                  aspectRatio: controller.cameraController!.value.aspectRatio,
                  child: CameraPreview(controller.cameraController!))),
        // _getCameraOverlay(),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    //_showBottomSheet();
                    controller.findCar();
                  },
                  child: Image.asset(
                    "assets/images/taptostart.png",
                    height: Get.height * 0.4,
                  )),
              SizedBox(
                height: 25,
              ),
              Text400(
                text: 'Tap on the button when ready',
                fontSize: 22,
              ),
            ],
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
        padding: EdgeInsets.all(20),
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
            Text700(
                textAlign: TextAlign.center,
                text:
                    'Something went wrong. Please try again.'),
            // if (controller.errorMessage != null && !kReleaseMode)
            //   Container(
            //     margin: EdgeInsets.only(top: 20),
            //     child: Text700(text: controller.errorMessage!),
            //   ),
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
                text: 'Wroom again',
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
              if (controller.isSimulator)
                Container(
                  child: Image.asset(
                    'assets/images/bmwx1.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              if (!controller.isSimulator)
                Image.file(
                  File(controller.licenceImage!.path),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              Container(
                // padding: EdgeInsets.all(200),
                height: 400,
                margin: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
                child: RiveAnimation.asset(
                  'assets/images/vroom_animation.riv',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (controller.cameraStates == CameraStates.cameraDone) {
      return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/done.png',
                width: 200,
              ),
              Text700(
                text: 'Wroomed!',
                fontSize: 28,
              ),
              SizedBox(
                height: 50,
              ),
              if (controller.car != null)
                Text700(
                  text: '${controller.car!.make} ${controller.car!.model}',
                  fontSize: 23,
                  textAlign: TextAlign.center,
                ),
              SizedBox(
                height: 20,
              ),
              Text400(
                text: 'has been added to your garage.',
                fontSize: 15,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  height: 56,
                  width: double.infinity,
                  child: AppButtonField(
                      text: 'View in Garage',
                      onPressed: controller.viewInGarage)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 56,
                  width: double.infinity,
                  child: AppButtonField(
                      haveBorder: true,
                      text: 'Share on feed',
                      primary: Colors.transparent,
                      onPressed: controller.shareOnFeed)),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: controller.reset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text400(
                      text: 'Spotted another car? ',
                      fontSize: 16,
                    ),
                    Text400(
                      text: 'Wroom again',
                      fontSize: 16,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              )
            ]),
      );
    }

    return Container();
  }
}
