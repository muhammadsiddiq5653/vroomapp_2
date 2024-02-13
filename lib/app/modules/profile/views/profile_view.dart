import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/feed/views/feed_card.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_profile_avatar.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../data/models/user_model.dart';
import '../../../widgets/app_form_fields/app_icon_button.dart';
import '../../../widgets/app_state_handler.dart';
import '../../../widgets/app_text/small_bold_text.dart';
import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_600.dart';
import '../../../widgets/app_text/text_700.dart';
import '../../../widgets/loadmore.dart';
import '../../edit_profile/views/edit_profile_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar(

      ),
      body: GetBuilder<ProfileController>(
        builder: (_) => Container(
            decoration: BoxDecoration(
                color: AppColors.background
            ),
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text700(
                    text: 'Profile',
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AnimatedCrossFade(
                    duration: Duration(milliseconds: 200),
                    firstChild: Container(
                      child: _getProfileHeader(),
                    ),
                    secondChild: Container(
                      child: AppTile(
                          containerColor: AppColors.cardColor,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              AppProfileAvatar(
                                size: 42,
                                user: profileController
                                            .settingsService.authModel !=
                                        null
                                    ? profileController
                                        .settingsService.authModel!.userModel
                                    : UserModel(email: ""),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text700(
                                  text: controller.settingsService.authModel
                                          ?.userModel.name ??
                                      '',
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppIconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.SETTINGS);
                                },
                                icon: Remix.settings_4_fill,
                                size: 42,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              AppIconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                      EditProfileView(),
                                      );
                                  controller.update();
                                },
                                icon: Remix.pencil_fill,
                                size: 42,
                              ),
                            ],
                          )),
                    ),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeOut,
                    crossFadeState: controller.direction == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text700(
                    text: 'Posts',
                    fontSize: 22.sp,
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: AppStateHandler(
                      loadingState: controller.loadingState,
                      emptyWidget: _getEmptyState(),
                      onRetry: () {
                        controller.loadFeed();
                      },
                      hasRefreshIndicator: true,
                      child: LoadMore(
                        isFinish: controller.feed?.haveNext == false,
                        onLoadMore: () async {
                          return await controller.loadFeed(
                              page: (controller.feed?.currentPage ?? 0) + 1);
                        },
                        child: ListView.separated(
                          physics: AlwaysScrollableScrollPhysics(),
                          controller: controller.scrollController,
                          itemCount: (controller.feed?.collection.length ?? 0),
                          itemBuilder: (context, index) {
                            var item = controller.feed!.collection[index];
                            return FeedCard(
                              feedModel: item,
                              onLikeButton: controller.like,
                              onShareButton: controller.share, onDeleteButton: controller.delete,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                        ),
                      )),
                ),
              ],
            )),
      ),
    );
  }

  Column _getProfileHeader() {
    return Column(children: [
      SizedBox(
        height: 30.h,
      ),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          AppTile(
              containerColor: AppColors.cardColor,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 90, 15, 15),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            children: [
                              Text700(
                                text: controller.settingsService.authModel
                                        ?.userModel.name ??
                                    '',
                                fontSize: 30.sp,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text400(
                                text:
                                    "@${controller.settingsService.authModel?.userModel.username} " ??
                                        '',
                                color: AppColors.surface.withOpacity(0.9),
                                fontSize: 18.sp,
                              ),
                            ],
                          ),

                        ]),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Text400(
                    //             text: 'Wrooms',
                    //             fontSize: 16,
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text600(
                    //             text: controller.settingsService.authModel
                    //                     ?.userModel.wrooms ??
                    //                 '--',
                    //             color: AppColors.surface.withOpacity(0.9),
                    //             fontSize: 18,
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Text400(
                    //             text: 'Posts',
                    //             fontSize: 16,
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text600(
                    //             text: controller.settingsService.authModel
                    //                     ?.userModel.posts ??
                    //                 '--',
                    //             color: AppColors.surface.withOpacity(0.9),
                    //             fontSize: 18,
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Text400(
                    //             text: 'Fav. Brand',
                    //             fontSize: 16,
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text600(
                    //             text: controller.settingsService.authModel
                    //                     ?.userModel.favoriteCarBrand ??
                    //                 '--',
                    //             color: AppColors.surface.withOpacity(0.9),
                    //             fontSize: 18,
                    //           ),
                    //         ],
                    //       ),
                    //     ]),
                  ],
                ),
              )),
          Positioned(

            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIconButton(
                    onPressed: () {
                      Get.toNamed(Routes.SETTINGS);
                    },
                    icon: Remix.settings_4_fill,
                  ),
                  AppIconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        EditProfileView(),
                      );
                    },
                    icon: Remix.pencil_fill,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            child: AppProfileAvatar(
              size: 105,
              user: profileController.settingsService.authModel != null &&
                      profileController.settingsService.authModel
                          .toString()
                          .isNotEmpty
                  ? profileController.settingsService.authModel!.userModel
                  : UserModel(email: ""),
            ),
          ),
        ],
      )
    ]);
  }

  _getEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/NoPosts.png',
          width: 92.w,
        ),
        SizedBox(height: 15.h,),
        Text700(
          text: 'No Posts, Yet!',
          color: AppColors.surface,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h,),
        Text400(
          fontSize: 12.sp,
          textAlign: TextAlign.center,
          text: 'Wroom some cars and share them\non the feed to fill this space!',
          color: AppColors.surface.withOpacity(0.9),
        ),
      ],
    );
  }
}
