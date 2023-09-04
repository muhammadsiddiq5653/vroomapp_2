import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/data/api/app_feed_api.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/services/sound_service.dart';

import '../../../data/models/feed_model.dart';

class CardDetailsController extends AppAbstractController {
  final soundService = Get.put(SoundService());
  final appCarsApi = Get.put(AppCarsApi());
  final appFeedApi = Get.put(AppFeedApi());
  CarModel? car;
  int? carId;
  @override
  void onInit() {
    super.onInit();
    loadingState = GeneralLoadingState.waiting;
    if (Get.arguments?[AppConstants.carArgument] != null) {
      car = Get.arguments?[AppConstants.carArgument];
    }
    carId = int.tryParse(Get.parameters[AppConstants.carArgumentId] ?? '');

    if (carId != null) {
      loadCarModel();
    } else {
      loadingState = GeneralLoadingState.done;
      soundService.playEngineIgnition();
    }
  }

  void loadCarModel() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      car = await appCarsApi.getCar(carId);
      loadingState = GeneralLoadingState.done;
      soundService.playEngineIgnition();
    } catch (ex) {
      loadingState = GeneralLoadingState.error;
    } finally {
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void battleNow() {
    Get.offAndToNamed(Routes.BATTLE_STEP_MATCHING_OPPONENT,
        arguments: {'car': car});
  }

  void shareCar() async {
    try {
      await appFeedApi.add(FeedModel(
          carModel: car,
          cover: '',
          createdAt: DateTime.now(),
          description: ''));
      dialogService.showInfo('Car added to the feed');
    } catch (ex) {
      dialogService.showError(ex);
    }
  }

  void deleteCar() async {
    try {
      EasyLoading.show();
      await appCarsApi.deleteUserCar(car!.userCardId);
      // dialogService.showInfo('Car deleted');
      Get.back(result: true);
    } catch (ex) {
      dialogService.showError('Cant delete the car, already deleted?');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void onMenuSelected(int value) {
    if (value == 0) {
      shareCar();
    } else if (value == 1) {
      deleteCar();
    }
  }
}
