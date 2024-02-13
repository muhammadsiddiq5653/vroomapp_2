import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  final controller = Get.put(PreviewController());
  final pages = <Map<String, String>>[
    {
      "title": "Discover any car",
      "subtitle": "Point your phone to any car and get cool \nimages and info",
      "image": "assets/images/Slide01.png"
    },
    {
      "title": "Love cars?",
      "subtitle": "Show other Wroomers what cars you find \nand get reacts",
      "image": "assets/images/Slide02.png"
    },
    {
      "title": "Follow friends",
      "subtitle": "Get alerts when other people love the cars \nyou find",
      "image": "assets/images/Slide03.png"
    },
    {
      "title": "Your car app",
      "subtitle": "Easily update settings and preferences in \nyour profile",
      "image": "assets/images/Slide04.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreviewController>(
      builder: (_) => Scaffold(
          body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: controller.videoPlayerController.value.size.width,
                  height: controller.videoPlayerController.value.size.height,
                  child: VideoPlayer(
                    controller.videoPlayerController,
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity.h,
              width: double.infinity.w,
              color: AppColors.background.withOpacity(0.5),
            ),
            // Container(
            //   height: double.infinity,
            //   width: double.infinity,
            //   child: PageView.builder(
            //       itemCount: pages.length,
            //       onPageChanged: (val) {
            //         controller.setPageIndex(val);
            //       },
            //       itemBuilder: (_, index) {
            //         var item = pages[index];
            //         return SingleSliderPage(
            //           item: item,
            //           controller: controller,
            //         );
            //       }),
            // ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     margin: EdgeInsets.only(top: 45),
            //     child: Image.asset(
            //       'assets/images/LogoforGettingStarted.png',
            //       width: 100.w,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 150,
            //   left: 0,
            //   right: 0,
            //   child: SliderDots(pages: pages, pageIndex: controller.pageIndex),
            // ),
            Positioned(
              bottom: 160,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      height: 55.h,
                      width: double.infinity.w,
                      margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
                      child: AppButtonField(
                          haveBorder: false,
                          primary: AppColors.background.withOpacity(0.8),
                          text: 'Lets Wroom',
                          elevation: 3,
                          onPressed: () {
                            Get.toNamed(Routes.MAIN_TABS);
                            //Get.to(NotLoggedinProfile());
                            //Get.to(NotLoggedinAlert());
                            //Get.to(NotLoggedinFeed());
                            //Get.to(NotLoggedinHome());
                          }),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    // Container(
                    //   height: 55,
                    //   width: double.infinity,
                    //   margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    //   child: AppButtonField(
                    //       primary: AppColors.primary,
                    //       text: 'Login',
                    //       elevation: 3,
                    //       onPressed: () {
                    //         Get.toNamed(Routes.LOGIN_DETAILS_STEP);
                    //       }),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Container(
                    //   height: 55,
                    //   width: double.infinity,
                    //   margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    //   child: AppButtonField(
                    //       primary: Colors.transparent,
                    //       text: 'Create an account',
                    //       elevation: 0,
                    //       onPressed: () {
                    //         Get.toNamed(Routes.SIGNUP_STEP_PHONE);
                    //       }),
                    // ),
                    // SizedBox(
                    //   height: 70,
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
