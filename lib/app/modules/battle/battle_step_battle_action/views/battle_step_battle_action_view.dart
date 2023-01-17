import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/card_details/views/components/car_card.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../controllers/battle_step_battle_action_controller.dart';

class BattleStepBattleActionView
    extends GetView<BattleStepBattleActionController> {
  const BattleStepBattleActionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BattleStepBattleActionController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text700(
                    text: controller.winner ? 'You Won!! ' : 'You Lost :(',
                    fontSize: 40,
                    animate: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text700(
                    text: controller.winner ? 'Card won' : 'Got beaten by',
                    fontSize: 15,
                    animate: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarCard(car: controller.opponentCar),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: AppButtonField(
                      text: 'Battle Again',
                      onPressed: () {
                        Get.offAndToNamed(Routes.BATTLE_STEP_CHOOSE_CAR);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: AppButtonField(
                      text: 'Home',
                      onPressed: () {
                        Get.offAllNamed(Routes.MAIN_TABS);
                      },
                      primary: AppColors.primary,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
