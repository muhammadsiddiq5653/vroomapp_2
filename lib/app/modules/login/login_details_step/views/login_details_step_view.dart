import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_form_fields/app_text_field.dart';
import '../../../../widgets/app_keyboard_hider.dart';
import '../../../../widgets/app_text/text_400.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/login_details_step_controller.dart';

class LoginDetailsStepView extends GetView<LoginDetailsStepController> {
   LoginDetailsStepView({Key? key}) : super(key: key);
  final Uri _url = Uri.parse('http://wroom.zedandwhite.com/privacy/');


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginDetailsStepController>(
      builder: (_) => AppKeyboardHider(
        child: Container(

          child: Scaffold(
            // appBar: InsideAppBar(
            //   title: '',
            // ),
            body: Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  color: AppColors.background
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OuterAppBar(
                            title: '',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text700(
                            text: 'Enter your details to login',
                            textAlign: TextAlign.center,
                            fontSize: 22.sp,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          // AppPhoneField(
                          //     number: controller.number,
                          //     onChanged: (number) {
                          //       controller.phone = number.phoneNumber ?? '';
                          //     }),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          AppTextField(
                            hintText: 'Username',
                            labelText: 'Username',
                            onChanged: (val) {
                              controller.userName = val;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.toNamed(Routes.FORGOT_PASSWORD_PHONE);
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Text400(
                          //         text: 'Forgot Password?',
                          //         fontSize: 14,
                          //       ),
                          //       SizedBox(
                          //         width: 5,
                          //       ),
                          //       Text400(
                          //         text: 'Reset it now',
                          //         fontSize: 14,
                          //         color: AppColors.primary,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55.h,
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 47,
                      ),
                      width: double.infinity,
                      child: AppButtonField(
                        text: 'Continue'.toUpperCase(),
                        onPressed: () {
                          if(controller.userName.isNotEmpty)
                            {
                              controller.verifyUserName();
                              Get.toNamed(Routes.LOGIN);
                            }
                          else
                            {
                              controller.dialogService.showError("Please enter valid username");
                            }



                          // controller.login();
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
                    //         " or ",
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
                    //   height: 40,
                    // ),
                    // Container(
                    //   height: 55,
                    //   margin: EdgeInsets.symmetric(
                    //     vertical: 10,
                    //     horizontal: 47,
                    //   ),
                    //   width: double.infinity,
                    //   child: AppButtonField(
                    //     prefix: Image.asset(
                    //       'assets/images/google.png',
                    //       height: 24,
                    //       width: 24,
                    //     ),
                    //     text: 'Continue with Google',
                    //     onPressed: () async {
                    //       await controller.signInWithGoogle();
                    //       //Get.toNamed(Routes.MAIN_TABS);
                    //     },
                    //     textColor: Colors.black.withOpacity(0.54),
                    //     primary: Colors.white,
                    //     haveBorder: false,
                    //   ),
                    // ),
                    // Container(
                    //   height: 55,
                    //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 47),
                    //   width: double.infinity,
                    //   child: AppButtonField(
                    //     prefix: Image.asset(
                    //       'assets/images/facebook.png',
                    //       height: 24,
                    //       width: 24,
                    //     ),
                    //     text: 'Continue with Facebook',
                    //     onPressed: () async {
                    //       await controller.signInWithFacebook();
                    //       //Get.toNamed(Routes.MAIN_TABS);
                    //     },
                    //     primary: Color(0xfff1877F2),
                    //     haveBorder: false,
                    //   ),
                    // ),
                    SizedBox(
                      height: 40.h,
                    ),
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
}
