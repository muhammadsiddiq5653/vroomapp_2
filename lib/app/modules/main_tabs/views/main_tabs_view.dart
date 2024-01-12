import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/modules/alerts/notloggedin_alerts.dart';
import 'package:vroom_app/app/modules/alerts/views/alerts_view.dart';
import 'package:vroom_app/app/modules/feed/notloggedin_feed.dart';
import 'package:vroom_app/app/modules/feed/views/feed_view.dart';
import 'package:vroom_app/app/modules/home/views/home_view.dart';
import 'package:vroom_app/app/modules/profile/views/profile_view.dart';

import '../../../app_colors.dart';
import '../../home/notloggedin_home.dart';
import '../../profile/notloggedin_profile.dart';
import '../controllers/main_tabs_controller.dart';

class MainTabsView extends GetView<MainTabsController> {
  final mainTabsController = Get.put(MainTabsController());

  MainTabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabsController>(
        builder: (_) => Container(
              child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Image.asset(
                        'assets/images/svg/bottomNav/wroomIcon1.png',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.isLoggedin.value
                        ? controller.scan()
                        : Get.snackbar(
                            'You are Not Logged in',
                            'Please Login First',
                            snackPosition: SnackPosition.TOP,
                            colorText: Colors.white,
                          );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                body: _getPage(),
                extendBody: true,
                bottomNavigationBar: BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  elevation: 0,
                  backgroundColor: HexColor("#141415").withOpacity(0.7),
                  onTap: controller.onTap,
                  unselectedItemColor: Colors.white.withOpacity(0.25),
                  selectedFontSize: 18.sp,
                  selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                  unselectedFontSize: 0,
                  selectedItemColor: Colors.white,
                  currentIndex:
                      controller.pageIndex < 0 ? 0 : controller.pageIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/GarageActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        icon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/GarageInActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        label: 'Garage'.toUpperCase()),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/FeedActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        icon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/FeedInActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        label: 'Feed'.toUpperCase()),

                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/AlertsActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        icon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/AlertsInActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        label: 'Alerts'.toUpperCase()),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/ProfileActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        icon: SvgPicture.asset(
                          'assets/images/svg/bottomNav/ProfileInActive.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                        label: 'Profile'.toUpperCase()),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Remix.group_line,
                    //       size: 25,
                    //     ),
                    //     label: 'Leaders'.toUpperCase()),
                  ],
                ),
              ),
            ));
  }

  _getPage() {
    switch (controller.pageIndex) {
      case 0:
        return controller.isLoggedin.value ? HomeView() : NotLoggedinHome();

      case 1:
        return controller.isLoggedin.value ? FeedView() : NotLoggedInFeedView();

      case 2:
        return controller.isLoggedin.value ? AlertsView() : NotLoggedinAlert();
      case 3:
        return controller.isLoggedin.value
            ? ProfileView()
            : NotLoggedinProfile();
      default:
        return Scaffold(
          body: Container(
            width: double.infinity.w,
            height: double.infinity.h,
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
    }
  }
}
