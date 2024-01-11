import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app_colors.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_bars/game_app_bar.dart';
import '../../widgets/app_form_fields/app_button_field.dart';

class NotLoggedinAlert extends StatelessWidget {
  const NotLoggedinAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: GameAppBar(
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient
        ),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Image.asset("assets/images/AlertNotSignIn.png",
                    height: Get.height  * 0.2 ,),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Alerts will show up here!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Login or create an account to\nget notified when someone\nlikes or shares your posts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  height: 55.h,
                  width: double.infinity.w,
                  margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
                  child: AppButtonField(
                      primary: AppColors.primary,
                      text: 'Login',
                      elevation: 3,
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN_DETAILS_STEP);
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: double.infinity.w,
                  margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
                  child: AppButtonField(
                      primary: Colors.transparent,
                      text: 'Create an account',
                      elevation: 0,
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP_STEP_PHONE);
                      }),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),

        ),
      ),
    );
  }
}
