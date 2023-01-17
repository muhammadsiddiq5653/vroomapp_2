import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class SignupStepVerifyController extends GetxController {
  TextEditingController pinController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  String code = '';
  String phone = '';
  String phoneCode = '';

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments?['phone'];
    phoneCode = Get.arguments?['phoneCode'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void verify() {
    Get.toNamed(Routes.SIGNUP_STEP_DETAIL,
        arguments: {'phone': phone, 'phoneCode': phoneCode});
  }
}
