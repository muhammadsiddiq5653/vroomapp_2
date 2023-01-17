import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';

import 'package:vroom_app/app/modules/card_details/views/components/car_card.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_profile_avatar.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../controllers/battle_step_matching_opponent_controller.dart';

class BattleStepMatchingOpponentView
    extends GetWidget<BattleStepMatchingOpponentController> {
  BattleStepMatchingOpponentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BattleStepMatchingOpponentController>(
      init: BattleStepMatchingOpponentController(),
      builder: (_) => Scaffold(
        appBar: InsideAppBar(
          title: 'Matcing opponent',
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(children: [
                    Expanded(
                      child: CarCard(
                        car: controller.car,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: _getOpponent(),
                    ),
                  ]),
                  Container(
                    height: 1,
                    width: controller.progressBar,
                    color: AppColors.primary,
                  ),
                  Container(
                    width: 94,
                    height: 94,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(74),
                        boxShadow: [
                          BoxShadow(
                              //offset: Offset(0, 4),
                              color: AppColors.primary, //edited
                              spreadRadius: 3,
                              blurRadius: 8 //edited
                              )
                        ]),
                    child: Center(
                        child: Text700(
                      key: Key(
                          'BattleStepMatchingOpponentController-${controller.counter}'),
                      text: '${controller.counter}',
                      animate: true,
                    )),
                  ),
                ],
              ),
            ),
            if (controller.gameResult != null)
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  _getInsideWheel(),
                  Positioned(
                    top: -10,
                    child: Image.asset(
                      'assets/images/cursor.png',
                      width: 50,
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _getInsideWheel() {
    var widget = Container(
      alignment: Alignment.center,
      width: Get.width - 20,
      height: Get.width - 20,
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        // color: Colors.black,
        image: DecorationImage(
          image: AssetImage("assets/images/wheel.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text700(text: 'Weight'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(quarterTurns: 3, child: Text700(text: 'price')),
                  RotatedBox(
                      quarterTurns: 5, child: Text700(text: 'City Milage'))
                ],
              ),
              RotatedBox(quarterTurns: 6, child: Text700(text: 'Engine Power')),
            ]),
      ),
    );

    if (controller.isWheenShown) {
      return AnimatedRotation(
        curve: Curves.easeInOut,
        duration: Duration(seconds: 1),
        turns: controller.turns ?? 1,
        child: widget,
      );
    } else {
      return Animate(
        effects: [ScaleEffect()],
        onComplete: (_) {
          controller.wheelIsShown();
        },
        child: widget,
      );
    }
  }

  Widget _getOpponent() {
    if (controller.secondPlayerCar != null) {
      return MatchOpponentCard(car: controller.secondPlayerCar!);
    }

    return AppTile(
      child: Container(
        child: Center(child: Text600(text: 'Matching you up...')),
      ),
    );
  }
}

class MatchOpponentCard extends StatelessWidget {
  final CarModel car;
  MatchOpponentCard({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTile(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            // color: Colors.black,
            image: DecorationImage(
          image: AssetImage("assets/images/match.png"),
          fit: BoxFit.cover,
        )),
        child: Transform.rotate(
          angle: -pi / 6.0,
          child: Center(
              child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            color: HexColor("#17171A"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Container(
                    color: AppColors.primary,
                    child: Image.asset(
                      'assets/images/user.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text700(
                          text: car.user?.name?.toUpperCase() ?? 'un named'.tr,
                          animate: true,
                          color: HexColor("#E5C622"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text700(
                          text: 'is ready'.toUpperCase(),
                          animate: true,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text700(
                          text: 'with'.toUpperCase(),
                          animate: true,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text700(
                          text: '${car.make} ${car.model}'.toUpperCase(),
                          color: HexColor("#E5C622"),
                          animate: true,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
