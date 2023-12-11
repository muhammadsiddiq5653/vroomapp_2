import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_phone_field.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../../app_validations.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_phone_controller.dart';

class SignupStepPhoneView extends GetView<SignupStepPhoneController> {
  final controller = Get.put(SignupStepPhoneController());

  SignupStepPhoneView({Key? key}) : super(key: key);
  final empSignUpFormKey = GlobalKey<FormState>();

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
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: empSignUpFormKey,
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
                        Validator: AppValidations.validatePhoneNumber,
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
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 55,
                        width: double.infinity,
                        child: AppButtonField(
                          text: 'Continue',
                          onPressed: () {
                            if (empSignUpFormKey.currentState!.validate()) {
                              controller.next();
                            }
                          },
                          primary: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                      //       await controller.signInWithFacebook();
                      //       //Get.toNamed(Routes.MAIN_TABS);
                      //     },
                      //     primary: Color(0xfff1877F2),
                      //     haveBorder: false,
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text400(
                            textAlign: TextAlign.center,
                            text:
                                "By continuing you are agreeing our license agreement,privacy policy, Agreement on the processing of personal data."),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
