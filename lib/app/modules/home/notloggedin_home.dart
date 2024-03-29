import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app_colors.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_bars/game_app_bar.dart';
import '../../widgets/app_form_fields/app_button_field.dart';

class NotLoggedinHome extends StatelessWidget {
  const NotLoggedinHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      appBar: GameAppBar(
          ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.background
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 65.h,
              ),
              Text(
                'Welcome to your Garage!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'The cars you wroom\n will be stored here once you\nlogin or create an account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.h,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.w400,
                ),
              ),

              Image.asset("assets/images/HomeNotLoggedIn.png"),

              Container(
                height: 45.h,
                width: double.infinity,
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
                height: 45.h,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
                child: AppButtonField(
                    primary: Colors.transparent,
                    text: 'Create an account',
                    elevation: 0,
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUP_STEP_PHONE);
                    }),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
