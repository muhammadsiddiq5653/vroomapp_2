import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';

import '../../../app_colors.dart';
import '../../../data/models/user_model.dart';
import '../../../widgets/app_bars/game_app_bar.dart';
import '../../../widgets/app_state_handler.dart';
import '../../../widgets/loadmore.dart';
import '../controllers/leaderboard_controller.dart';
import 'components/Leader_board_header.dart';
import 'components/leader_board_user_list_tile.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  final LeaderboardController leaderboardController =
      Get.put(LeaderboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaderboardController>(
      builder: (_) => Scaffold(
        appBar: GameAppBar(
            userModel:
                leaderboardController.settingsService.authModel!.userModel),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NestedScrollView(
                headerSliverBuilder: (
                  _,
                  ___,
                ) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 320,
                      floating: true,
                      leading: Container(),
                      flexibleSpace: LeaderBoardHeader(
                        totalCount: 20,
                        users: controller.getTop3(),
                        onUserclick: controller.gotoUser,
                        setShowForIndex: controller.setShowForIndex,
                        showFor: controller.showFor,
                        showForId: controller.showForId,
                      ),
                    )
                  ];
                },
                body: _getListViewOfUsers()),
            _getActiveUserTile(),
          ],
        ),
      ),
    );
  }

  Widget _getListViewOfUsers() {
    return AppStateHandler(
      hasRefreshIndicator: true,
      onRetry: () {
        controller.loadUsers();
      },
      loadingState: controller.loadingState,
      child: LoadMore(
        isFinish: controller.users?.haveNext == false,
        onLoadMore: () async {
          return await controller.loadUsers(
              page: (controller.users?.currentPage ?? 0) + 1);
        },
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          itemCount: controller.getAfterTop3().length,
          itemBuilder: (context, index) {
            var user = controller.getAfterTop3()[index];
            return LeaderBoardUserListTile(
              user: user,
              type: controller.showForId,
              rank: index + 4,
              onClick: controller.gotoUser,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }

  Container _getActiveUserTile() {
    if (controller.settingsService.authModel?.userModel == null)
      return Container();
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
      height: 80,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xFFAAAAAA).withOpacity(0.6),
            blurRadius: 7,
            spreadRadius: 2)
      ], color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: LeaderBoardUserListTile(
        showRank: false,
        primary: true,
        type: controller.showForId,
        user: controller.settingsService.authModel!.userModel,
        onClick: controller.gotoUser,
      ),
    );
  }
}
