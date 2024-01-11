import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:vroom_app/app/modules/login/login_details_step/controllers/login_details_step_controller.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_drop_down_button.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';

import '../../../app_colors.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../../../widgets/app_text/text_700.dart';

class LoginView extends GetView<LoginDetailsStepController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: InsideAppBar(title: ''),
      body: AppStateHandler(
        loadingState: controller.loadingState,
        child: Container(
          height: double.infinity,

          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/logo.png',
                //   width: 100,
                // ),
                OuterAppBar(
                  title: '',
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text700(
                  text: 'Enter your PIN',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 200.w,
                  height: 100.h,
                  // padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    // focusNode: controller.myFocusNode,
                    textStyle: TextStyle(color: AppColors.primary),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                      selectedFillColor: AppColors.primary,
                      inactiveColor: AppColors.primary,
                      inactiveFillColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 55.h,
                      fieldWidth: 40.w,
                      activeFillColor: Colors.transparent,
                    ),
                    useExternalAutoFillGroup: true,
                    autoFocus: false,
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    keyboardType: TextInputType.none,
                    cursorColor: Colors.white,
                    controller: controller.pinController,
                    onCompleted: (v) {
                      // controller.verify();
                    },
                    onChanged: (value) {
                      if (value.length <= 4) controller.password = value;
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text600(
                //       text: 'Forgot pin? ',
                //       fontSize: 14,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Get.bottomSheet(
                //             AppBottomSheet(child: forgetPasswordDialog()));
                //         // forgetPasswordDialog(),
                //       },
                //       child: Text600(
                //         text: 'Reset it now',
                //         color: AppColors.primary,
                //         fontSize: 14,
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20.h,
                ),

                VirtualKeyboard(
                    // [0-9] + .
                    fontSize: 20.sp,
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
                            } else if (controller.pinController.text.isNotEmpty) {
                              controller.pinController.text =
                                  controller.pinController.text + key.text;
                            }
                          }
                          break;
                      }

                      print(controller.pinController.text);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    height: 54.h,
                    width: double.infinity,
                    child: AppButtonField(
                      text: 'Login'.toUpperCase(),
                      onPressed: () {
                        controller.login();
                      },
                      primary: AppColors.primary,
                    )),
                // SizedBox(
                //   height: double.infinity,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgetPasswordDialog() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        children: [
          Column(
            children: [
              Text700(
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  text: 'Before you continue?'),
              SizedBox(
                height: 20,
              ),
              Text400(
                textAlign: TextAlign.center,
                fontSize: 14,
                text:
                    'Please verify that you are the right person to \nreset the pin by answering the question below.',
              ),
              SizedBox(
                height: 30,
              ),
              Text600(
                //  textAlign: TextAlign.left,
                fontSize: 14,
                text: 'What’s your favorite car brand?',
              ),
              SizedBox(
                height: 4,
              ),
              Obx(() {
                return AppDropdownButton(
                  options: [
                    AppDropdownButtonItem(value: "Acura", title: "Acura"),
                    AppDropdownButtonItem(
                        value: "Alfa Romeo", title: "Alfa Romeo"),
                    AppDropdownButtonItem(
                        value: "Aston Martin", title: "Aston Martin"),
                    AppDropdownButtonItem(value: "Audi", title: "Audi"),
                    AppDropdownButtonItem(value: "Bentley", title: "Bentley"),
                    AppDropdownButtonItem(value: "BMW", title: "BMW"),
                    AppDropdownButtonItem(value: "Bugatti", title: "Bugatti"),
                    AppDropdownButtonItem(value: "Buick", title: "Buick"),
                    AppDropdownButtonItem(value: "Cadillac", title: "Cadillac"),
                    AppDropdownButtonItem(value: "Changan", title: "Changan"),
                    AppDropdownButtonItem(value: "Chery", title: "Chery"),
                    AppDropdownButtonItem(
                        value: "Chevrolet", title: "Chevrolet"),
                    AppDropdownButtonItem(value: "Chrysler", title: "Chrysler"),
                    AppDropdownButtonItem(value: "Daihatsu", title: "Daihatsu"),
                    AppDropdownButtonItem(value: "Datsun", title: "Datsun"),
                    AppDropdownButtonItem(value: "Ferarri", title: "Ferarri"),
                    AppDropdownButtonItem(value: "Fiat", title: "Fiat"),
                    AppDropdownButtonItem(value: "Ford", title: "Ford"),
                    AppDropdownButtonItem(value: "Genesis", title: "Genesis"),
                    AppDropdownButtonItem(value: "GMC", title: "GMC"),
                    AppDropdownButtonItem(value: "Honda", title: "Honda"),
                    AppDropdownButtonItem(value: "Hummer", title: "Hummer"),
                    AppDropdownButtonItem(value: "Hyundai", title: "Hyundai"),
                    AppDropdownButtonItem(value: "Infiniti", title: "Infiniti"),
                    AppDropdownButtonItem(value: "Jaguar", title: "Jaguar"),
                    AppDropdownButtonItem(value: "Jeep", title: "Jeep"),
                    AppDropdownButtonItem(value: "Kia", title: "Kia"),
                    AppDropdownButtonItem(
                        value: "Koenigsegg", title: "Koenigsegg"),
                    AppDropdownButtonItem(
                        value: "Lamborghini", title: "Lamborghini"),
                    AppDropdownButtonItem(
                        value: "Land Rover", title: "Land Rover"),
                    AppDropdownButtonItem(value: "Lexus", title: "Lexus"),
                    AppDropdownButtonItem(value: "Lotus", title: "Lotus"),
                    AppDropdownButtonItem(value: "Maserati", title: "Maserati"),
                    AppDropdownButtonItem(value: "Maybach", title: "Maybach"),
                    AppDropdownButtonItem(value: "Mazda", title: "Mazda"),
                    AppDropdownButtonItem(value: "McLaren", title: "McLaren"),
                    AppDropdownButtonItem(
                        value: "Mercedes Benz", title: "Mercedes Benz"),
                    AppDropdownButtonItem(value: "Mini", title: "Mini"),
                    AppDropdownButtonItem(
                        value: "Mitsubishi", title: "Mitsubishi"),
                    AppDropdownButtonItem(value: "Nissan", title: "Nissan"),
                    AppDropdownButtonItem(value: "Pagani", title: "Pagani"),
                    AppDropdownButtonItem(value: "Porsche", title: "Porsche"),
                    AppDropdownButtonItem(value: "Renault", title: "Renault"),
                    AppDropdownButtonItem(value: "Rimac", title: "Rimac"),
                    AppDropdownButtonItem(
                        value: "Rolls Royce", title: "Rolls Royce"),
                    AppDropdownButtonItem(value: "Suzuki", title: "Suzuki"),
                    AppDropdownButtonItem(value: "Tesla", title: "Tesla"),
                    AppDropdownButtonItem(value: "Toyota", title: "Toyota"),
                    AppDropdownButtonItem(
                        value: "Volkswagen", title: "Volkswagen"),
                    AppDropdownButtonItem(value: "Volvo", title: "Volvo"),
                  ],
                  onChanged: (String? s) {
                    controller.updateCarBrand(s!);
                  },
                  //  isPill: true,
                  title: 'What’s your favorite car brand?',
                  popUptitle: 'What’s your favorite car brand?',
                  value: controller.carBrand.value,
                );
              }),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: AppButtonField(
                  primary: AppColors.primary,
                  onPressed: () {
                    // Get.back(result: true);
                  },
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
