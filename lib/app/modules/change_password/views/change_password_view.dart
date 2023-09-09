import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app_colors.dart';
import '../../../widgets/app_bars/inside_app_bar.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../../../widgets/app_form_fields/app_text_field.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordController signupController =
      Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: InsideAppBar(title: ''),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // shrinkWrap: true,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "You can change \nyour password here!".tr,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  if (controller.firebaseIdToken == null)
                    AppTextField(
                      obscureText: true,
                      hintText: 'Old Password'.tr,
                      labelText: 'Old Password'.tr,
                      onChanged: (value) {
                        controller.oldPassword = value;
                      },
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    obscureText: true,
                    hintText: 'New Password'.tr,
                    labelText: 'New Password'.tr,
                    onChanged: (value) {
                      controller.newPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    obscureText: true,
                    hintText: 'Confirm New Password'.tr,
                    labelText: 'Confirm New Password'.tr,
                    onChanged: (value) {
                      controller.confirmPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: AppButtonField(
                        text: 'Update Password'.tr,
                        onPressed: () {
                          controller.finish();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
