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
  final pages = [
    {
      "icon": Remix.search_2_line,
      "title": "Your Inner Athlete",
      "subtitle": "Discover",
      "image": "assets/images/slider/1.png"
    },
    {
      "icon": Remix.map_pin_2_line,
      "title": "Nearby Venues",
      "subtitle": "Find",
      "image": "assets/images/slider/2.png"
    },
    {
      "title": "Nearby Venues",
      "subtitle": "Book",
      "image": "assets/images/slider/3.png"
    },
    {
      "title": "With Passion",
      "subtitle": "Play",
      "image": "assets/images/slider/4.png"
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
                      height: 70,
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
                            Get.toNamed(Routes.SIGNUP);
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
                            Get.toNamed(Routes.LOGIN);
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
