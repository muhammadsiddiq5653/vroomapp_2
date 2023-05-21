import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';

import '../../../widgets/app_text/text_600.dart';
import '../../card_details/views/components/car_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController _) => Scaffold(
          appBar: GameAppBar(),
          floatingActionButton: Container(
            height: 52,
            width: 52,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 5,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  controller.scanCar();
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
                        spreadRadius: 14,
                        blurRadius: 7,
                        offset: Offset(3, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: AppStateHandler(
              loadingState: controller.loadingState,
              emptyWidget: _getEmptyState(),
              onRetry: () {
                controller.loadCards();
              },
              hasRefreshIndicator: true,
              child: LoadMore(
                isFinish: controller.cars?.haveNext == false,
                onLoadMore: () async {
                  return await controller.loadCards(
                      page: (controller.cars?.currentPage ?? 0) + 1);
                },
                child: ListView.separated(
                    itemCount: controller.cars?.collection.length ?? 0,
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 10,
                        )),
                    itemBuilder: (BuildContext context, int index) {
                      var car = controller.cars!.collection[index];
                      return CarCard(
                        car: car,
                        onTap: controller.onCarTap,
                      );
                    }),
              ),
            ),
          )),
    );
  }

  Widget _getEmptyState() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text700(
              text: "New to the game?",
              fontSize: 25,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/blankslatehome.png'),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text600(
                text:
                    "You haven’t vroomed any cars, yet! Tap on the BIG RED scan button to get started.",
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 35.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Image.asset(
            //       'assets/images/arrow.png',
            //       height: 100,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
