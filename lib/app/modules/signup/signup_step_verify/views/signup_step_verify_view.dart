import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_text/text_400.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_verify_controller.dart';

class SignupStepVerifyView extends GetView<SignupStepVerifyController> {
  final controller = Get.put(SignupStepVerifyController());

  SignupStepVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupStepVerifyController>(
      builder: (_) => Scaffold(
        // appBar: InsideAppBar(
        //   title: '',
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OuterAppBar(title: ""),
                SizedBox(
                  height: 30,
                ),
                Text700(
                  text: 'Choose a PIN Code',
                  textAlign: TextAlign.center,
                  fontSize: 22,
                ),
                SizedBox(
                  height: 30,
                ),
                Text400(
                  text: 'This will be used as your password',
                  fontSize: 14,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    //  focusNode: controller.myFocusNode,
                    textStyle: TextStyle(color: AppColors.primary),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                      selectedFillColor: AppColors.primary,
                      inactiveColor: AppColors.primary,
                      inactiveFillColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                    ),
                    autoFocus: true,
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    keyboardType: TextInputType.none,
                    cursorColor: Colors.white,
                    controller: controller.pinController,
                    onCompleted: (v) {
                      controller.phoneCode = v;
                      controller.verify();
                    },
                    onChanged: (value) {
                      controller.phoneCode = value;
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                VirtualKeyboard(
                    // [0-9] + .
                    fontSize: 20,
                    type: VirtualKeyboardType.Numeric,
                    textColor: Colors.white,
                    onKeyPress: (key) {
                      VirtualKeyboardKey k = key;
                      print(k.toString());
                      switch (k.keyType) {
                        case VirtualKeyboardKeyType.Action:
                          {
                            if (controller.pinController.text.isEmpty) {
                            } else {
                              controller.pinController.text =
                                  controller.pinController.text.substring(0,
                                      controller.pinController.text.length - 1);
                            }
                          }

                          break;
                        case VirtualKeyboardKeyType.String:
                          {
                            if (key.text == ".") {
                            } else if (controller.pinController.text.isEmpty) {
                              controller.pinController.text = key.text;
                            } else if (controller
                                .pinController.text.isNotEmpty) {
                              controller.pinController.text =
                                  controller.pinController.text + key.text;
                            }
                          }
                          break;
                      }

                      print(controller.pinController.text);
                    }),
                //Spacer(),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: AppButtonField(
                    text: 'Verify',
                    onPressed: () {
                      controller.verify();
                    },
                    primary: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
