import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_bars/inside_app_bar.dart';
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
                  text: 'Verify the 6-Digit Code',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  focusNode: controller.myFocusNode,
                  textStyle: TextStyle(color: AppColors.primary),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    activeColor: AppColors.primary,
                    selectedColor: AppColors.primary,
                    selectedFillColor: AppColors.primary,
                    inactiveColor: AppColors.primary,
                    inactiveFillColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    // fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                  ),
                  autoFocus: true,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: false,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  controller: controller.pinController,
                  onCompleted: (v) {
                    controller.verify();
                  },
                  onChanged: (value) {
                    controller.code = value;
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text400(
                      text: 'Resend code in',
                      fontSize: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text400(
                      text: '33',
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: AppButtonField(
                    text: 'Verify'.toUpperCase(),
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
