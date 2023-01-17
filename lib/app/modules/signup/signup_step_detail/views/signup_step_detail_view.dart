import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';

import '../../../../app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_bars/inside_app_bar.dart';
import '../../../../widgets/app_form_fields/app_button_field.dart';
import '../../../../widgets/app_form_fields/app_text_field.dart';
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
                            text: 'Add more details to the account',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                padding:
                                    EdgeInsets.only(left: Get.width / 2 - 70),
                                itemBuilder: (_, index) {
                                  var selected = index == 0;
                                  return Center(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      height: selected ? 106 : 76,
                                      width: selected ? 106 : 76,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            selected ? 53 : 38),
                                        child: Container(
                                          color: AppColors.primary,
                                          child: Image.asset(
                                            'assets/images/user.png',
                                            width: 52,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text400(
                            text: 'Swipe to choose an avatar',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          AppTextField(
                            hintText: 'Name',
                            labelText: 'Enter number',
                            onChanged: (val) {
                              controller.user.name = val;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            hintText: 'Email',
                            labelText: 'Enter user email',
                            onChanged: (val) {
                              controller.user.email = val;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            hintText: 'Password',
                            labelText: 'Enter user password',
                            obscureText: true,
                            onChanged: (val) {
                              controller.user.password = val;
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
                    text: 'Continue'.toUpperCase(),
                    onPressed: () {
                      controller.regsiter();
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
