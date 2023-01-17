import 'package:get/get.dart';

import '../controllers/battle_step_matching_opponent_controller.dart';

class BattleStepMatchingOpponentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BattleStepMatchingOpponentController>(
      () => BattleStepMatchingOpponentController(),
    );
  }
}
