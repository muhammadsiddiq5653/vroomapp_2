import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../controllers/preview_controller.dart';
import 'components/single_slider_page.dart';
import 'components/slider_dots.dart';

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
      "title": "Follow friends as headline",
      "subtitle": "Get alerts when other people love the cars \nyou find",
      "image": "assets/images/Slide03.png"
    },
    {
      "title": "Your car app.",
      "subtitle": "Easily update settings and preferences in \nyour profile",
      "image": "assets/images/Slide04.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreviewController>(
      builder: (_) => Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [

            Container(
              height: double.infinity,
              width: double.infinity,
              child: PageView.builder(
                  itemCount: pages.length,
                  onPageChanged: (val) {
                    controller.setPageIndex(val);
                  },
                  itemBuilder: (_, index) {
                    var item = pages[index];
                    return SingleSliderPage(item: item);
                  }),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 45),
                child: Image.asset(
                  'assets/images/LogoforGettingStarted.png',
                  width: 100,
                ),
              ),
            ),
            Positioned(
            bottom: 215,
              left: 0,
              right: 0,
              child: SliderDots(pages: pages, pageIndex: controller.pageIndex),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
                      child: AppButtonField(
                          primary: AppColors.primary,
                          text: 'Get Started',
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
                      height: 40,
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
