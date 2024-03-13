import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/modules/alerts/notloggedin_alerts.dart';
import 'package:vroom_app/app/modules/alerts/views/alerts_view.dart';
import 'package:vroom_app/app/modules/feed/notloggedin_feed.dart';
import 'package:vroom_app/app/modules/feed/views/feed_view.dart';
import 'package:vroom_app/app/modules/home/views/home_view.dart';
import 'package:vroom_app/app/modules/profile/views/profile_view.dart';

import '../../../app_colors.dart';
import '../../../data/models/car_model.dart';
import '../../../helpers/hexcolor.dart';
import '../../../routes/app_pages.dart';
import '../../card_details/views/components/car_card.dart';
import '../../home/notloggedin_home.dart';
import '../../profile/notloggedin_profile.dart';
import '../controllers/main_tabs_controller.dart';

class MainTabsView extends GetView<MainTabsController> {
  final mainTabsController = Get.put(MainTabsController());

  MainTabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabsController>(
        builder: (_) => Scaffold(
              backgroundColor: AppColors.primary,
              body: Container(
                  width: double.infinity.w,
                  height: double.infinity.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Text(
                        'Tap to Wroom',
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 300.h,
                        child: RiveAnimation.asset(
                          'assets/animations/wroom_pulse.riv',
                          clipRect: Rect.fromCircle(
                            center: Offset(280.w, 220.h),
                            radius: 200.r,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      mainTabsController.isLoggedIn()
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search_rounded,
                                  size: 20.sp,
                                ),
                                color: AppColors.primary,
                              ),
                            )
                          : Expanded(
                              child: DraggableScrollableSheet(
                                  controller: controller.controller,
                                  builder: (context, controller) {
                                    return Container(
                                      padding: EdgeInsets.all(20.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                        color: AppColors.bottomSheetColor,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: SingleChildScrollView(
                                          child: Column(
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.primary
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                HomeView(),
                                                transition: Transition.downToUp,
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                popGesture: true,
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'My Garage',
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '4 cars',
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                    );
                                  }),
                            ),

                      // Container(
                      //   width: 400.w,
                      //   height: 220.h,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(20.r),
                      //       topRight: Radius.circular(20.r),
                      //     ),
                      //     color: AppColors.bottomSheetColor,
                      //     shape: BoxShape.rectangle,
                      //   ),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       controller.pageIndex = 0;
                      //     },
                      //     child: Column(
                      //       children: [
                      //
                      //
                      //
                      //
                      //       ],
                      //
                      //     )
                      //   ),
                      // ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  )),
              extendBody: true,
            ));
  }

// _getPage() {
//   switch (controller.pageIndex) {
//     case 0:
//       return controller.isLoggedin.value ? HomeView() : NotLoggedinHome();
//
//     case 1:
//       return controller.isLoggedin.value ? FeedView() : NotLoggedInFeedView();
//
//     case 2:
//       return controller.isLoggedin.value ? AlertsView() : NotLoggedinAlert();
//     case 3:
//       return controller.isLoggedin.value
//           ? ProfileView()
//           : NotLoggedinProfile();
//     default:
//       return Scaffold(
//         body: Container(
//           width: double.infinity.w,
//           height: double.infinity.h,
//           decoration: BoxDecoration(color: AppColors.background),
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       );
//   }
// }
}
