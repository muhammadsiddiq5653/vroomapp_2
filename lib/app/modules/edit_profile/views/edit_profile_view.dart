import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app_colors.dart';
import '../../../widgets/app_bars/inside_app_bar.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../../../widgets/app_form_fields/app_text_field.dart';
import '../../../widgets/app_form_fields/app_upload_photo_field.dart';
import '../../../widgets/app_keyboard_hider.dart';
import '../../../widgets/app_text/text_700.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  final EditProfileController controller = Get.put(EditProfileController());
  EditProfileView({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (_) => AppKeyboardHider(
        child:  Container(
          color: AppColors.background,
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
                            AppUploadPhotoField(
                              width: 150,
                              height: 150,
                              initialImage: controller
                                  .settingsService.authModel?.userModel.avatar,
                              onImageChanged: (String? img) {
                                controller.userImage = img;
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            AppTextField(
                              defaultValue: controller.name,
                              hintText: 'Name',
                              labelText: 'Enter number',
                              onChanged: (val) {
                                controller.name = val;
                              },
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // AppTextField(
                            //   defaultValue: controller.email,
                            //   hintText: 'Email',
                            //   labelText: 'Enter user email',
                            //   onChanged: (val) {
                            //     controller.email = val;
                            //   },
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // AppTextField(
                            //   hintText: 'Password',
                            //   labelText: 'Enter user password',
                            //   obscureText: true,
                            //   onChanged: (val) {
                            //     controller.user.password = val;
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: AppButtonField(
                      text: 'Save',
                      onPressed: () {
                        controller.save();

                      },
                      primary: AppColors.primary,
                    ),
                  )
                ],
              ),
        ),
          ),


    );
  }
}
