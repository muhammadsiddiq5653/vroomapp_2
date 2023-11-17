import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  @override
  void onInit() {
    super.onInit();
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

  Future<void> scan() async {
    if (!box.hasData(dontShowAgain) || box.read<bool>(dontShowAgain) == false) {
      var result = await Get.bottomSheet(AppBottomSheet(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text700(
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      text: 'Instructions to Wroom',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/bmw.png',
                      width: 253,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text400(
                        fontSize: 14,
                        text:
                            'Wrooming a car works in a THREE QUARTER angle. Please make sure to hold your phone at the angle where your car looks similar to the above image to Wroom Successfully.'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: AppButtonField(
                        text: 'Got it',
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: AppButtonField(
                        primary: Colors.transparent,
                        text: 'Don\'t show this again',
                        onPressed: () {
                          Get.back(result: dontShowAgain);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
      if (result == dontShowAgain) {
        box.write(dontShowAgain, true);
      }
    }
    Get.toNamed(Routes.SCAN_CAR);
  }
}
