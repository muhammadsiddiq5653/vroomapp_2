import 'dart:async';

import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/services/match_making_service.dart';

class BattleStepMatchingOpponentController extends AppAbstractController {
  final matchMakingService = Get.put(MatchMakingService());
  final carsApi = Get.put(AppCarsApi());
  double progressBar = 0;
  int counter = 1;
  late CarModel car;
  CarModel? secondPlayerCar;
  late Timer timer;
  late Timer progressTimer;
  bool isWheenShown = false;
  double? turns;
  Map<dynamic, dynamic>? gameResult;

  @override
  void onInit() {
    super.onInit();
    car = Get.arguments?['car'];
  }

  @override
  void onReady() {
    super.onReady();
    matchMakingService.joinQueue(
        callback: matchStarted,
        userID: settingsService.authModel!.userModel.id!,
        car: car);
    startTime();
    startProgressTimer();
  }

  @override
  void onClose() {
    super.onClose();
    try {
      matchMakingService.closeQueueStream();
      _cancelTimers();
    } catch (ex) {}
  }

  void _cancelTimers() {
    timer.cancel();
    progressTimer.cancel();
  }

  void startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
    });
  }

  void startProgressTimer() {
    progressTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      progressBar += 10;
      if (progressBar > Get.width) {
        progressBar = 0;
      }
      update();
    });
  }

  matchStarted(Map? gameInfo) async {
    _cancelTimers();
    print("from mathcing controller");
    print(gameInfo);
    if (gameInfo == null) return;
    var cardIds = List<int>.from(gameInfo['gameInfo']['cardIds']);
    var opponenetCard =
        cardIds.firstWhereOrNull((element) => element != car.userCardId);
    if (opponenetCard != null) {
      secondPlayerCar = await carsApi.getCar(opponenetCard);
      update();
    }
    await Future.delayed(Duration(milliseconds: 2000));
    gameResult = gameInfo;
    update();
    matchMakingService.closeQueueStream();
  }

  void wheelIsShown() async {
    isWheenShown = true;
    update();
    await Future.delayed(Duration(milliseconds: 500));
    turns = 2 + ((gameResult!['category'] as int).toDouble() * 0.25);
    update();
    await Future.delayed(Duration(milliseconds: 3000));
    Get.offAndToNamed(Routes.BATTLE_STEP_BATTLE_ACTION, arguments: {
      'car': car,
      'opponent_car': secondPlayerCar,
      'winner': gameResult!['winner'],
      'category': gameResult!['category']
    });
  }
}
