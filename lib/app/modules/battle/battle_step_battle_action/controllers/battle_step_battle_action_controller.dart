import 'package:get/get.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

class BattleStepBattleActionController extends AppAbstractController {
  late Map<dynamic, dynamic> gameResult;
  late CarModel car;
  late CarModel opponentCar;
  late int winnerCategory;
  late bool winner;

  @override
  void onInit() {
    super.onInit();
    gameResult = Get.arguments;
    winner = AppUtilities.ensureInt(gameResult['winner']) ==
        settingsService.authModel!.userModel.id;
    winnerCategory = gameResult['category'];
    car = gameResult['car'];
    opponentCar = gameResult['opponent_car'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
