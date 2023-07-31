import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
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
      "title": "Wroom Cars Around You",
      "subtitle":
          "Just point your phone at the car with the app open and Wroom will add that car to your garage.",
      "image": "assets/images/Slide01.png"
    },
    {
      "title": "Show Them What You Got",
      "subtitle":
          "Share the best pictures of cars you wroom with your friends and everyone else on the app.",
      "image": "assets/images/Slide02.png"
    },
    {
      "title": "Get Notified About What’s Important",
      "subtitle":
          "Stay up-to-date with what’s going on in Wroom with push notifications",
      "image": "assets/images/Slide03.png"
    },
    {
      "title": "Your Profile Is The Home For Your Activities",
      "subtitle":
          "All your settings, personalization and posts can be managed from your profile page",
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
                    SliderDots(pages: pages, pageIndex: controller.pageIndex),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: AppButtonField(
                          primary: AppColors.primary,
                          text: 'Create an account'.toUpperCase(),
                          elevation: 3,
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP_STEP_PHONE);
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: AppButtonField(
                          primary: Colors.transparent,
                          text: 'Login'.toUpperCase(),
                          elevation: 0,
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN_DETAILS_STEP);
                          }),
                    ),
                    SizedBox(
                      height: 70,
                    )
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
