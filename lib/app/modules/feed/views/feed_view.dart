import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';

import '../../../app_colors.dart';
import '../../../widgets/app_state_handler.dart';
import '../../../widgets/app_text/small_bold_text.dart';
import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_700.dart';
import '../controllers/feed_controller.dart';
import 'feed_card.dart';

class FeedView extends GetView<FeedController> {
  final feedController = Get.put(FeedController());

  FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (_) => Scaffold(
        appBar: GameAppBar(
            userModel: feedController.settingsService.authModel!.userModel),

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
                    return FeedCard(
                      feedModel: item,
                      onLikeButton: controller.like,
                      onShareButton: controller.share,
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
            'assets/images/NoPosts.png',
            width: 92,
          ),
          SizedBox(height: 15,),
          Text700(
            text: 'No Posts, Yet!',
            color: AppColors.surface,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Text400(
            fontSize: 12,
            textAlign: TextAlign.center,
            text: 'Wroom some cars and share them\non the feed to fill this space!',
            color: AppColors.surface.withOpacity(0.9),
          ),
        ],
      ),
    );
  }
}
