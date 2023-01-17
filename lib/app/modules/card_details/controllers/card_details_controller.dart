import 'package:get/get.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/services/sound_service.dart';

class CardDetailsController extends GetxController {
  final soundService = Get.put(SoundService());
  late CarModel car;
  @override
  void onInit() {
    super.onInit();
    car = Get.arguments[AppConstants.carArgument];
  }

  @override
  void onReady() {
    super.onReady();
    soundService.playEngineIgnition();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
