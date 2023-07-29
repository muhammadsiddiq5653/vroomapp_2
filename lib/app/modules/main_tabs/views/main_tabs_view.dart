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
import 'package:vroom_app/app/widgets/app_profile_avatar.dart';

import '../controllers/main_tabs_controller.dart';

class MainTabsView extends GetView<MainTabsController> {
  final mainTabsController = Get.put(MainTabsController());
  MainTabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabsController>(
        builder: (_) => Scaffold(
              body: _getPage(),
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(top: 0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF1E1E22).withOpacity(0.06),
                        offset: Offset(0, -2),
                        spreadRadius: 0,
                        blurRadius: 2)
                  ],
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  elevation: 0,
                  backgroundColor: HexColor("#141415"),
                  onTap: controller.onTap,
                  unselectedItemColor: Colors.white.withOpacity(0.25),
                  selectedFontSize: 20,
                  unselectedFontSize: 0,
                  selectedItemColor: Colors.white,
                  currentIndex:
                      controller.pageIndex < 0 ? 0 : controller.pageIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Remix.dashboard_fill,
                          size: 25,
                        ),
                        label: 'Garage'.toUpperCase()),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Remix.compass_3_line,
                          size: 25,
                        ),
                        label: 'Feed'.toUpperCase()),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Remix.notification_2_line,
                          size: 25,
                        ),
                        label: 'Alerts'.toUpperCase()),
                    BottomNavigationBarItem(
                        icon: AppProfileAvatar(
                          user: controller.settingsService.authModel?.userModel,
                          size: 25,
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
        return HomeView();
      case 1:
        return FeedView();
      case 2:
        return AlertsView();
      case 3:
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
