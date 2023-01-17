import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/modules/card_details/views/components/car_card_mini.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../controllers/battle_step_choose_car_controller.dart';

class BattleStepChooseCarView extends GetView<BattleStepChooseCarController> {
  const BattleStepChooseCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BattleStepChooseCarController>(
      builder: (_) => Scaffold(
        appBar: InsideAppBar(
          title: 'Choose your car',
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Center(
            child: ListView.builder(
                itemCount: controller.getList().length,
                itemBuilder: (context, index) {
                  var item = controller.getList()[index];
                  return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CarCardMini(
                        topCategoryCarModel: item,
                        onTap: (CarModel car) {
                          controller.chooseCar(car);
                        },
                      ));
                }),
          ),
        ),
      ),
    );
  }
}
