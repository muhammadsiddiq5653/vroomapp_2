import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_users_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../../app_exception.dart';
import '../../../../routes/app_pages.dart';
import '../../tap_to_start.dart';

class SignupStepVerifyController extends AppAbstractController {
  AppUsersApi appUsersApi = Get.put(AppUsersApi());
  TextEditingController pinController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  String code = '';
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
    phone = Get.arguments?['phone'];
    phoneCode = Get.arguments?['phoneCode'];
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
      if (phone.isNotEmpty && phoneCode.isNotEmpty) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) {
            print(credential.smsCode);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e);
            dialogService.showError(
                "We can't verify your number. Please enter the 6 digit code again"
                    .tr);
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;
            print('Got VerificationID');
            print(verificationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        retryTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          counter ??= 60;
          counter = counter! - 1;
          if (counter == 0) {
            timer.cancel();
            counter = null;
          }
          update();
        });
      }
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void verify() async {
    try {
      // unawaited(EasyLoading.show());
      // var credential = PhoneAuthProvider.credential(
      //     verificationId: verificationId, smsCode: code);
      // await FirebaseAuth.instance
      //     .signInWithCredential(credential)
      //     .catchError((onError) {
      //   dialogService.showError('Sorry, Wrong OTP. Please try again'.tr);
      //   print('SignIn Error: ${onError.toString()}\n\n');
      // });
      Get.to(TapToStart());
      // await appUsersApi.verify(settingsService.authModel!.userModel.id!);
      // settingsService.authModel!.userModel.phoneVerified = true;
      // Get.toNamed(Routes.SIGNUP_STEP_DETAIL,
      //     arguments: {'phone': phone, 'phoneCode': phoneCode});
    } catch (ex) {
      print(ex);
      dialogService.showError(
          "We can't verify your number. Please enter the 6 digit code again"
              .tr);
    } finally {
      unawaited(EasyLoading.dismiss());
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
      EasyLoading.show();
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
      EasyLoading.dismiss();
    }
  }
}
