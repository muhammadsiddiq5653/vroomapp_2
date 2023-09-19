import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_phone_field.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_phone_controller.dart';

class SignupStepPhoneView extends GetView<SignupStepPhoneController> {
  final controller = Get.put(SignupStepPhoneController());
  SignupStepPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupStepPhoneController>(
      builder: (_) => AppKeyboardHider(
        child: Scaffold(
          appBar: InsideAppBar(
            title: '',
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text700(
                    text: 'Enter your phone number',
                    textAlign: TextAlign.center,
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AppPhoneField(
                    number: controller.number,
                    onChanged: (val) {
                      controller.phone = val.phoneNumber ?? '';
                      controller.phoneCode = val.dialCode ?? '';
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text400(
                    text:
                        'We will send a 4-Digit confirmation code on this phone. You will have to verify that on the next screen to continue.',
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: AppButtonField(
                      text: 'Continue',
                      onPressed: () {
                        controller.next();
                      },
                      primary: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
