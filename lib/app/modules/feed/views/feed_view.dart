import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';

import '../../../widgets/app_state_handler.dart';
import '../../../widgets/app_text/small_bold_text.dart';
import '../../../widgets/app_text/small_text.dart';
import '../controllers/feed_controller.dart';
import 'feed_card.dart';

class FeedView extends GetView<FeedController> {
  const FeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: AppStateHandler(
          loadingState: GeneralLoadingState.done,
          emptyWidget: _getEmptyState(),
          onRetry: () {
            // controller.loadCards();
          },
          hasRefreshIndicator: true,
          child: LoadMore(
            isFinish: true,
            onLoadMore: () async {
              return true;
            },
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return FeedCard();
                }),
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
