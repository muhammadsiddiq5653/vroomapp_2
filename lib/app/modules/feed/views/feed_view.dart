import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';

import '../../../widgets/app_state_handler.dart';
import '../../../widgets/app_text/small_bold_text.dart';
import '../controllers/feed_controller.dart';
import 'feed_card.dart';

class FeedView extends GetView<FeedController> {
  final feedController = Get.put(FeedController());
  FeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (_) => Scaffold(
        appBar: GameAppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
