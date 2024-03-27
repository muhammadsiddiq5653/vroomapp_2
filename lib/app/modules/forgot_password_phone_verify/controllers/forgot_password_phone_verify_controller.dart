import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_abstract_controller.dart';

class ForgotPasswordPhoneVerifyController extends AppAbstractController {
  String code = '';
  String verificationId = '';
  int? counter;
  Timer? retryTimer;
  TextEditingController pinController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  String? phone;
  String? phoneCode;
  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    if (Get.arguments != null) {
      phone = Get.arguments?['phone'] ?? false;
    }
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    retryTimer?.cancel();
    super.onClose();
  }

  void init() async {
    try {
      pinController.text = '';
      if (phone != null) {
        phoneCode = phone!.substring(0, 3);
        phone = phone!.substring(3);
      }
    } catch (ex, stack) {
      print(ex);
    }
  }


  void goBack() {
    Get.back();
  }
}
