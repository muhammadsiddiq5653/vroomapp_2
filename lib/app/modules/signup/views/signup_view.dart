import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../../../widgets/social_media_buttons.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: InsideAppBar(title: ''),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text700(
                  text: 'Welcome,\nPlease create an account to continue',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                GoogleLogin(),
                SizedBox(
                  height: 20,
                ),
                FacebookLogin(),
                SizedBox(
                  height: 20,
                ),
                AppleLogin(),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 54,
                    width: double.infinity,
                    child: AppButtonField(
                      text: 'Signup with your info',
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP_STEP_PHONE);
                      },
                      primary: AppColors.primary,
                    )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(Routes.LOGIN);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text400(
                        text: 'Already a vroomer?',
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text400(
                        text: 'login',
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
