import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/data/models/feed_model.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/feed/controllers/feed_controller.dart';
import 'package:vroom_app/app/modules/feed/views/feed_card.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';

class NotLoggedInFeedView extends GetView<FeedController> {
  final feedController = Get.put(FeedController());

  NotLoggedInFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (_) => Scaffold(
        appBar: GameAppBar(
          userModel: UserModel(email: ""),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: AppFloatingActionButton(
        //   onClick: controller.scanCar,
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
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
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: controller.feed?.collection.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.feed!.collection[index];
                    return
                      index == 0
                        ?
                    FeedCard(
                            notLoggedInCard: true,
                            feedModel: FeedModel(
                                description: '',
                                cover: '',
                                createdAt: DateTime.now(),
                                image: 'assets/images/FeedImageNotSignedIn.png',
                                userModel: UserModel(
                                    email: '',
                                    avatar: '',
                                    username: '@username',
                                    name: 'You')),
                            onLikeButton: (feedModel) {},
                            onShareButton: (FeedModel, b) {}, onDeleteButton: (FeedModel ) {  },
                          )
                        : FeedCard(
                            manageShare: true,
                            feedModel: item,
                        onDeleteButton: (FeedModel f) {
                            feedController.feed!.collection.removeWhere((element) => element.id == f.id);
                              controller.update();
                        },
                            onLikeButton: (feedModel) {
                              Get.bottomSheet(Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Wrap(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "You Need an Account For This",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Exo',
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          height: 55,
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.fromLTRB(47, 0, 47, 0),
                                          child: AppButtonField(
                                              primary: AppColors.primary,
                                              text: 'Login',
                                              elevation: 3,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.LOGIN_DETAILS_STEP);
                                              }),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 55,
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.fromLTRB(47, 0, 47, 0),
                                          child: AppButtonField(
                                              primary: Colors.transparent,
                                              text: 'Create an account',
                                              elevation: 0,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.SIGNUP_STEP_PHONE);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                            },
                            onShareButton: (FeedModel, b) {
                              Get.bottomSheet(Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Wrap(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "You Need an Account For This",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Exo',
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          height: 55,
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.fromLTRB(47, 0, 47, 0),
                                          child: AppButtonField(
                                              primary: AppColors.primary,
                                              text: 'Login',
                                              elevation: 3,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.LOGIN_DETAILS_STEP);
                                              }),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 55,
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.fromLTRB(47, 0, 47, 0),
                                          child: AppButtonField(
                                              primary: Colors.transparent,
                                              text: 'Create an account',
                                              elevation: 0,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.SIGNUP_STEP_PHONE);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                            },
                          );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  _getEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/alertsEmptyState.png',
            width: 250,
          ),
          SmallBoldText(
            text: 'The feed is still empty!',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
