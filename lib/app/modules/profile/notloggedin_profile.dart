import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_colors.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_bars/game_app_bar.dart';
import '../../widgets/app_form_fields/app_button_field.dart';

class NotLoggedinProfile extends StatelessWidget {
  const NotLoggedinProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: GameAppBar(
        userModel:UserModel(email: ""),),
      body: GestureDetector(
        onTap: (){
          Get.toNamed(Routes.LOGIN_DETAILS_STEP);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset("assets/images/ProfileNotSignedIn.png",
                  height: Get.height  * 0.34 ,),
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                'Login or create an account to\nupdate this page with\nyour personalized profile.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 65,
              ),
              Container(
                height: 55,
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
                height: 20,
              ),
              Container(
                height: 55,
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
