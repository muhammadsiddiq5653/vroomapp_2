import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_phone_field.dart';

import '../../../../app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_bars/inside_app_bar.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_form_fields/app_text_field.dart';
import '../../../../widgets/app_keyboard_hider.dart';
import '../../../../widgets/app_text/text_400.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/login_details_step_controller.dart';

class LoginDetailsStepView extends GetView<LoginDetailsStepController> {
  const LoginDetailsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppKeyboardHider(
      child: Scaffold(
        appBar: InsideAppBar(
          title: '',
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
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
                          height: 30,
                        ),
                        Text700(
                          text: 'Enter your phone number and password',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AppPhoneField(
                            number: controller.number,
                            onChanged: (number) {
                              controller.phone = number.phoneNumber ?? '';
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        AppTextField(
                          hintText: 'Enter password',
                          labelText: 'Enter password',
                          onChanged: (val) {
                            controller.password = val;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              child: AppButtonField(
                text: 'Login'.toUpperCase(),
                onPressed: () {
                  controller.login();
                },
                primary: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
