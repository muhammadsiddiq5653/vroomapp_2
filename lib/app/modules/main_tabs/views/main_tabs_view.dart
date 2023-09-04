import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/modules/alerts/views/alerts_view.dart';
import 'package:vroom_app/app/modules/battle/views/battle_view.dart';
import 'package:vroom_app/app/modules/feed/views/feed_view.dart';
import 'package:vroom_app/app/modules/home/views/home_view.dart';
import 'package:vroom_app/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:vroom_app/app/modules/profile/views/profile_view.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_profile_avatar.dart';

import '../../../app_colors.dart';
import '../controllers/main_tabs_controller.dart';

class MainTabsView extends GetView<MainTabsController> {
  final mainTabsController = Get.put(MainTabsController());
  MainTabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabsController>(
        builder: (_) => Scaffold(
              body: _getPage(),
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                elevation: 0,
                backgroundColor: HexColor("#141415"),
                onTap: controller.onTap,
                unselectedItemColor: Colors.white.withOpacity(0.25),
                selectedFontSize: 18,
                selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                unselectedFontSize: 0,
                selectedItemColor: Colors.white,
                currentIndex:
                    controller.pageIndex < 0 ? 0 : controller.pageIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Remix.dashboard_fill,
                        size: 32,
                      ),
                      label: 'Garage'.toUpperCase()),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Remix.compass_3_line,
                        size: 32,
                      ),
                      label: 'Feed'.toUpperCase()),
                  BottomNavigationBarItem(
                      label: '',
                      icon: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SCAN_CAR);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/scanicon.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Remix.notification_2_line,
                        size: 32,
                      ),
                      label: 'Alerts'.toUpperCase()),
                  BottomNavigationBarItem(
                      icon: AppProfileAvatar(
                        user: controller.settingsService.authModel?.userModel,
                        size: 32,
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
            ));
  }

  _getPage() {
    switch (controller.pageIndex) {
      case 0:
        return HomeView();
      case 1:
        return FeedView();
      case 3:
        return AlertsView();
      case 4:
        return ProfileView();
      default:
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
    }
  }
}
