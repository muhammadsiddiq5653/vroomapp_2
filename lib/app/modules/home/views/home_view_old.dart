import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/modules/preview/views/components/slider_dots.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/big_header_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../../card_details/views/components/car_card.dart';
import '../controllers/home_controller.dart';

class HomeViewOld extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  HomeViewOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController _) => Scaffold(
        appBar: GameAppBar(
            userModel: homeController.settingsService.authModel!.userModel),
        floatingActionButton: Container(
          height: 52,
          width: 52,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 5,
              backgroundColor: AppColors.primary,
              onPressed: () {
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
        body: Stack(children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                BigHeaderText(
                  text: 'Daily Challenges',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 140,
                  // width: double.infinity,
                  // child: PageView(
                  //   children: controller.pages
                  //       .map((e) => Container(
                  //             margin: EdgeInsets.symmetric(horizontal: 10),
                  //             decoration: BoxDecoration(
                  //                 color: HexColor("#17171A"),
                  //                 borderRadius: BorderRadius.circular(15)),
                  //             height: 140,
                  //             child:
                  //                 Center(child: Text700(text: 'Challange WIP')),
                  //           ))
                  //       .toList(),
                  //   controller: PageController(
                  //     viewportFraction: 0.8,
                  //     initialPage: 0,
                  //   ),
                  // ),
                ),
                // Container(
                //     height: 50,
                //     child: SliderDots(pages: controller.pages, pageIndex: 0))
              ],
            ),
          ),
          bottomDetailsSheet()
        ]),
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .55,
      minChildSize: .55,
      maxChildSize: .9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: HexColor("#131316")),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                    color: HexColor("#0E0E0F"),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Expanded(
                child: ListView.separated(
                    controller: scrollController,
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
            ],
          ),
        );
      },
    );
  }
}
