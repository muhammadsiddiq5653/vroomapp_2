import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/app_users_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../../app_exception.dart';
import '../../tap_to_start.dart';

class SignupStepVerifyController extends AppAbstractController {
  AppUsersApi appUsersApi = Get.put(AppUsersApi());
  late TextEditingController pinController ;
  FocusNode myFocusNode = FocusNode();
  String phone = '';
  String phoneCode = '';
  String verificationId = '';
  int? counter;
  Timer? retryTimer;
  bool isSoft = false;
  bool isVerify = true;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    phone = Get.arguments?['username'];
    phoneCode = Get.arguments?['password'];
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    try {
      pinController.text = '';
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void verify() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      // var credential = PhoneAuthProvider.credential(
      //     verificationId: verificationId, smsCode: code);
      // await FirebaseAuth.instance
      //     .signInWithCredential(credential)
      //     .catchError((onError) {
      //   dialogService.showError('Sorry, Wrong OTP. Please try again'.tr);
      //   print('SignIn Error: ${onError.toString()}\n\n');
      // });
      box.write('phone', phone);
      box.write('pin', phoneCode);
      Get.offAndToNamed(Routes.SIGNUP_STEP_DETAIL);
      // await appUsersApi.verify(settingsService.authModel!.userModel.id!);
      // settingsService.authModel!.userModel.phoneVerified = true;
      // Get.toNamed(Routes.SIGNUP_STEP_DETAIL,
      //     arguments: {'phone': phone, 'phoneCode': phoneCode});
    } catch (ex) {
      print(ex);
      dialogService.showError("Please enter the 4 digit code again".tr);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }

  void toggleMode() {
    isVerify = !isVerify;
    if (isVerify == false) {
      hideKeyboard();
    } else {
      myFocusNode.requestFocus();
    }
    update();
  }

  void changePhoneNumber() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      await appUsersApi.changePhone(
          settingsService.authModel!.userModel.id, phone, phoneCode);
      settingsService.authModel!.userModel.phone = phone;
      settingsService.authModel!.userModel.phoneCode = phoneCode;
      toggleMode();
      init();
    } catch (ex, stack) {
      dialogService.showError(ex);
      captureException(ex, stackTrace: stack);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
