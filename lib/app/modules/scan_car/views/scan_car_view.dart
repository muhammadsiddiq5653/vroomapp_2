import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../../../widgets/app_text/small_text.dart';
import '../../../widgets/app_text/text_600.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.close,
                          size: 14.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text600(
                          text: 'Cancel',
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Container(
                height: 400.h,
                width: 400.h,
                child: GestureDetector(
                  onTap: () {
                    controller.findCar();
                  },
                  child: RiveAnimation.asset(
                    'assets/animations/wroom_action.riv',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SmallText(
                text: 'Point your camera at the car',
                fontSize: 16.sp,
                color: AppColors.background,
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
        color: AppColors.bottomSheetColor,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.h,
              height: 100.h,
              child: RiveAnimation.asset(
                'assets/animations/wroom_error.riv',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text700(
              textAlign: TextAlign.center,
              text: 'Sorry.',
              color: AppColors.primary,
            ),
            SizedBox(
              height: 20,
            ),
            SmallText(
              textAlign: TextAlign.center,
              text: 'We can\'t find it right now',
              color: AppColors.primary,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: AppButtonField(
                haveBorder: false,
                primary: Color(0xff00C969),
                onPressed: () {
                  controller.retry();
                },
                text: 'Try Again',
              ),
            ),
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
        child: Stack(
          alignment: Alignment.center,
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
              child: RiveAnimation.asset(
                'assets/animations/wroom_action.riv',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SmallText(
                    text: 'Identifying car...',
                    fontSize: 16.sp,
                    color: AppColors.background,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    if (controller.cameraStates == CameraStates.cameraDone) {
      return Container(
        color: AppColors.primary,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.h,
                height: 200.h,
                child: RiveAnimation.asset(
                  'assets/animations/wroom_success.riv',
                  fit: BoxFit.cover,
                ),
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
                      primary: AppColors.grey,
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
