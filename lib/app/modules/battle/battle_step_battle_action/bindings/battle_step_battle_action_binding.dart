import 'package:get/get.dart';

import '../controllers/battle_step_battle_action_controller.dart';

class BattleStepBattleActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BattleStepBattleActionController>(
      () => BattleStepBattleActionController(),
    );
  }
}
