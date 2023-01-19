import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_bars/inside_app_bar.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_700.dart';
import '../../../widgets/social_media_buttons.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                FlutterLogo(
                  size: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text700(
                  text: 'Welcome back,\nPlease login to continue',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
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
                      text: 'Login with your phone'.toUpperCase(),
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN_DETAILS_STEP);
                      },
                      primary: AppColors.primary,
                    )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text400(
                        text: 'New here?',
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text400(
                        text: 'signup',
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
