import 'package:get/get.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/data/models/envelope_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class HomeController extends AppAbstractController {
  AppCarsApi appCarsApi = Get.put(AppCarsApi());
  var pages = [
    {'title': 'Collect Cars'},
    {'title': 'Collect BMW'},
    {'title': 'Collect BMW'},
  ];
  EnvelopeModel<CarModel>? cars;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadCards();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onCarTap(CarModel car) {
    Get.toNamed(Routes.CARD_DETAILS,
        arguments: {AppConstants.carArgument: car});
  }

  void loadCards() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      update();
      cars = await appCarsApi.getCars();
      settingsService.cars = cars!.collection;
      if (settingsService.cars.length == 0) {
        settingsService.cars = [];
        loadingState = GeneralLoadingState.empty;
      } else {
        loadingState = GeneralLoadingState.done;
      }
    } catch (ex) {
      loadingState = GeneralLoadingState.error;
    } finally {
      update();
    }
  }

  void scanCar() async {
    await Get.toNamed(Routes.SCAN_CAR);
    loadCards();
  }
}
