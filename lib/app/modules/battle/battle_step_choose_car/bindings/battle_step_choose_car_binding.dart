import 'package:get/get.dart';

import '../controllers/battle_step_choose_car_controller.dart';

class BattleStepChooseCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BattleStepChooseCarController>(
      () => BattleStepChooseCarController(),
    );
  }
}
