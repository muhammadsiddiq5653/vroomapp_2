import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';
import '../../../widgets/app_state_handler.dart';
import '../../../widgets/app_text/text_700.dart';
import '../../../widgets/loadmore.dart';
import '../controllers/alerts_controller.dart';

class AlertsView extends GetView<AlertsController> {
  final alertsController = Get.put(AlertsController());
  AlertsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertsController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: GameAppBar(
           ),
        body: Container(
          decoration: BoxDecoration(
              color: AppColors.background,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: AppStateHandler(
            loadingState: controller.loadingState,
            emptyWidget: _getEmptyState(),
            onRetry: () {
              controller.loadNotifications();
            },
            hasRefreshIndicator: true,
            child: LoadMore(
              isFinish: controller.notifications?.haveNext == false,
              onLoadMore: () async {
                return await controller.loadNotifications(
                    page: (controller.notifications?.currentPage ?? 0) + 1);
              },
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text700(
                      text: 'Alerts',
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                        itemCount: controller.notifications?.collection.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.notifications!.collection[index];
                          return   GestureDetector(
                            onTap: () {
                              if (item.directLink != null)
                                Get.toNamed(item.directLink!);
                            },
                            child: AppTile(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      item.image!,
                                      width: 40.w,
                                      height: 40.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                      child: Text600(
                                    text: item.message,
                                    fontSize: 16.sp,
                                  )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text600(
                                    text: AppUtilities.dateToCoolStringWithHour(
                                        item.createdAt),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  if (item.directLink != null)
                                    Icon(
                                      Remix.arrow_right_circle_fill,
                                      color: AppColors.primary,
                                    )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _getEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/alertsEmptyState.png',
            width: 250,
          ),
          SmallBoldText(
            text: 'Nothing so far!',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SmallText(
            text: 'Here you can get alerts when your friends wroom cars.',
            color: Colors.white,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
