import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../app_constants.dart';
import '../../../routes/app_pages.dart';
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
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone!,
          verificationCompleted: (PhoneAuthCredential credential) {
            print(credential.smsCode);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.code);
            print(e.message);
            dialogService.showError(
                'Can not verify your number at the moment, please try again later.'
                    .tr);
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;
            update();
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
      print(ex);
    }
  }

  void verify() async {
    try {
      unawaited(EasyLoading.show());
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      var signin = await FirebaseAuth.instance
          .signInWithCredential(credential)
          .catchError((onError) {
        dialogService.showError('Wrong OTP code'.tr);
        print('SignIn Error: ${onError.toString()}\n\n');
      });
      var firebaseToken = await signin.user!.getIdToken();
      Get.offAndToNamed(Routes.CHANGE_PASSWORD,
          arguments: {AppConstants.firebaseTokenID: firebaseToken});
    } catch (ex) {
      print(ex);
    } finally {
      unawaited(EasyLoading.dismiss());
    }
  }

  void goBack() {
    Get.back();
  }
}
