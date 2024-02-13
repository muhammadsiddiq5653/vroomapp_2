import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_text_field.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_phone_controller.dart';

class SignupStepPhoneView extends GetView<SignupStepPhoneController> {
  final controller = Get.put(SignupStepPhoneController());
  final Uri _url = Uri.parse('http://wroom.zedandwhite.com/privacy/');

  SignupStepPhoneView({Key? key}) : super(key: key);
  final empSignUpFormKey = GlobalKey<FormState>();
  Rx<bool?> showValidation = Rx<bool?>(false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupStepPhoneController>(
      builder: (_) => AppKeyboardHider(
        child: Scaffold(
          // appBar: InsideAppBar(
          //   title: '',
          // ),
          body: Container(
            decoration: BoxDecoration(
                color: AppColors.background
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: empSignUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OuterAppBar(
                      title: '',
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Text700(
                      text: 'Welcome, Lets setup your account',
                      textAlign: TextAlign.center,
                      fontSize: 22.sp,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    AppTextField(
                      hintText: 'Username',
                      labelText: 'Username',
                      onChanged: (val) {
                        controller.username = val;
                      },
                      onTap: () {
                        showValidation.value = true;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() {
                      return Visibility(
                        visible: showValidation.value!,
                        child: Text400(
                            textAlign: TextAlign.left,
                            fontSize: 13.sp,
                            maxLines: 3,
                            text:
                                "Alphabets and Numbers are allowed. Less than 4 characters, Space between characters, Special Charactersare not allowed."),
                      );
                    }),
                    SizedBox(
                      height: 80.h,
                    ),
                    Container(
                      height: 45.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: double.infinity.w,
                      child: AppButtonField(
                        text: 'Continue',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (controller.username.isEmpty) {
                            controller.dialogService
                                .showError('Please Enter a UserName');
                          } else if (controller.username.isNotEmpty) {
                            if (RegExp(r'\s').hasMatch(controller.username)) {
                              controller.dialogService
                                  .showError('Username can not include spaces');
                            }
                            if (!isValidUsername(controller.username)) {
                              controller.dialogService.showError(
                                  'Only alphabets and numbers are allowed in the username');
                            } else {
                              controller.next();
                            }
                          }
                        },
                        primary: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         color: Colors.white,
                    //         height: 2,
                    //         width: MediaQuery.of(context).size.width / 2.8,
                    //       ),
                    //       Text(
                    //         " OR ".toUpperCase(),
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.w600,
                    //             fontStyle: FontStyle.italic),
                    //       ),
                    //       Container(
                    //         color: Colors.white,
                    //         height: 2,
                    //         width: MediaQuery.of(context).size.width / 2.8,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 55,
                    //   margin:
                    //       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //   width: double.infinity,
                    //   child: AppButtonField(
                    //     prefix: Image.asset(
                    //       'assets/images/google.png',
                    //       height: 24,
                    //       width: 24,
                    //     ),
                    //     text: 'Continue with Google',
                    //     onPressed: () async {
                    //      // await controller.signInWithGoogle();
                    //       //Get.toNamed(Routes.MAIN_TABS);
                    //     },
                    //     textColor: Colors.black.withOpacity(0.54),
                    //     primary: Colors.white,
                    //     haveBorder: false,
                    //   ),
                    // ),
                    // Container(
                    //   height: 55,
                    //   margin:
                    //       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //   width: double.infinity,
                    //   child: AppButtonField(
                    //     prefix: Image.asset(
                    //       'assets/images/facebook.png',
                    //       height: 24,
                    //       width: 24,
                    //     ),
                    //     text: 'Continue with Facebook',
                    //     onPressed: () async {
                    //      // await controller.signInWithFacebook();
                    //       //Get.toNamed(Routes.MAIN_TABS);
                    //     },
                    //     primary: Color(0xfff1877F2),
                    //     haveBorder: false,
                    //   ),
                    // ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text400(
                            textAlign: TextAlign.center,
                            fontSize: 14.sp,

                            text: "Please read our"),
                        GestureDetector(
                          onTap: () {
                            launchUrl(_url);
                          },
                          child: Text400(
                              textAlign: TextAlign.center,
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              color: AppColors.primary,
                              text: " privacy policy"),
                        ),
                        Text400(
                            textAlign: TextAlign.center,
                            fontSize: 14.sp,
                            maxLines: 1,
                            text: " and "),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse('http://wroom.zedandwhite.com/terms/'));
                          },
                          child: Text400(
                              textAlign: TextAlign.center,
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              color: AppColors.primary,
                              text: " terms"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidUsername(String username) {
    // Check length:
    if (username.length < 4 || username.length > 32) {
      return false;
    }

    // Check for alphanumeric characters only:
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (!validCharacters.hasMatch(username)) {
      return false;
    }

    return true;
  }
}
