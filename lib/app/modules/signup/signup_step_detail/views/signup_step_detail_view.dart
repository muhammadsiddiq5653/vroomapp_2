import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';

import '../../../../app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_bars/inside_app_bar.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_form_fields/app_text_field.dart';
import '../../../../widgets/app_form_fields/app_upload_photo_field.dart';
import '../../../../widgets/app_text/text_400.dart';
import '../../../../widgets/app_text/text_700.dart';
import '../controllers/signup_step_detail_controller.dart';

class SignupStepDetailView extends GetView<SignupStepDetailController> {
  final controller = Get.put(SignupStepDetailController());
  SignupStepDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupStepDetailController>(
      builder: (_) => AppKeyboardHider(
        child: Scaffold(
          appBar: InsideAppBar(
            title: '',
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          AppUploadPhotoField(
                            width: 150,
                            height: 150,
                            onImageChanged: (String? img) {
                              controller.userImage = img;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          AppTextField(
                            hintText: 'Enter your full name',
                            labelText: 'Enter number',
                            onChanged: (val) {
                              controller.user.name = val;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            hintText: 'Enter username',
                            labelText: 'Enter user name',
                            onChanged: (val) {
                              controller.user.username = val;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            hintText: 'Enter your favorite Car Brand',
                            labelText: 'Enter favorite Car Brand',
                            onChanged: (val) {
                              controller.user.favoriteCarBrand = val;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: AppButtonField(
                    text: 'Continue',
                    onPressed: () {
                      //controller.regsiter();
                      Get.toNamed(Routes.MAIN_TABS);

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
