import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_bottom_sheet.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../../../widgets/app_text/text_700.dart';

class MainTabsController extends AppAbstractController {
  var pageIndex = 0;
  final dontShowAgain = 'dontShowAgain';
  final box = GetStorage();

  RxBool isLoggedin = false.obs;

  @override
  void onInit() {
    super.onInit();

    readFromPreferences();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTap(int value) {
    pageIndex = value;
    update();
    soundService.playclick();
  }

  readFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedin.value = prefs.getBool("isloggedin") ?? false;
    update();
  }

  Future<void> scan() async {
    if (!box.hasData(dontShowAgain) || box.read<bool>(dontShowAgain) == false) {
      var result = await Get.bottomSheet(
          Container(
        color: AppColors.cardColor,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(17, 5, 17, 0),
        child: Column(
          children: [
            Text700(
              textAlign: TextAlign.center,
              fontSize: 18.sp,
              text: 'Instructions to Wroom',
            ),
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              'assets/images/bmw.png',
              width: 253.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text400(
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                text:
                    'Please make sure to hold your phone at the angle where your car looks similar to the above image to Wroom Successfully.'),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 55.h,
              child: AppButtonField(
                text: 'Got it',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 55.h,
              child: AppButtonField(
                primary: Colors.transparent,
                text: 'Don\'t show this again',
                onPressed: () {
                  Get.back(result: dontShowAgain);
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ));
      if (result == dontShowAgain) {
        box.write(dontShowAgain, true);
      }
    }
    Get.toNamed(Routes.SCAN_CAR);
  }
}
