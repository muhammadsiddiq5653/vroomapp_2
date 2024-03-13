import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_drop_down_button.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_form_fields/app_text_field.dart';
import '../../../../widgets/app_form_fields/app_upload_photo_field.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_detail_controller.dart';

class SignupStepDetailView extends GetView<SignupStepDetailController> {
  final controller = Get.put(SignupStepDetailController());
  SignupStepDetailView({Key? key}) : super(key: key);
  final personalizeProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupStepDetailController>(
      builder: (_) => AppKeyboardHider(
        child: Scaffold(
          // appBar: InsideAppBar(
          //   title: '',
          // ),
          body: Container(
            decoration: BoxDecoration(
              color: AppColors.background
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                        key: personalizeProfile,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text700(
                              text: 'Let’s personalize your profile',
                              textAlign: TextAlign.center,
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // AppUploadPhotoField(
                            //   width: 150,
                            //   height: 150,
                            //   onImageChanged: (String? img) {
                            //     controller.userImage = img;
                            //   },
                            // ),
                            SizedBox(
                              height: 50,
                            ),
                            AppTextField(
                              Validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null; // Return null if the input is valid
                              },
                              hintText: 'Enter your full name',
                              labelText: 'Enter Name',
                              onChanged: (val) {
                                controller.user.name = val;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              Validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Choose a username';
                                }
                                return null; // Return null if the input is valid
                              },
                              hintText: 'Enter your email',
                              labelText: 'Enter your email',
                              onChanged: (val) {
                                controller.user.email = val;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            // AppTextField(Validator: (val) {
                            //   if (val == null || val.isEmpty) {
                            //     return 'Please Enter your favorite Car Brand';
                            //   }
                            //   return null; // Return null if the input is valid
                            // },
                            //   hintText: 'Whats your favorite car brand?',
                            //   labelText: 'Enter favorite Car Brand',
                            //   onChanged: (val) {
                            //     controller.user.favoriteCarBrand = val;
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: AppButtonField(
                    text: 'Complete Setup'.toUpperCase(),
                    onPressed: () {

                      if (personalizeProfile.currentState!.validate()) {
                        controller.regsiter();
                      }
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
  bool isValidName(String username) {
    // Check length:
    if (username.length < 4 || username.length > 32) {
      return false;
    }

    // Check for alphabets characters only:
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (!validCharacters.hasMatch(username)) {
      return false;
    }

    return true;
  }
  bool isValidEmail(String username) {
    // Check length:
    if (username.length < 5 || username.length > 100) {
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
