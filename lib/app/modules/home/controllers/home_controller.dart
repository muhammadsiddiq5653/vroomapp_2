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

  Future<bool> loadCards({int page = 1}) async {
    try {
      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appCarsApi.getCars(page: page);
      if (page == 1) {
        cars = result;
        if ((cars?.collection.length ?? 0) == 0) {
          loadingState = GeneralLoadingState.empty;
        } else {
          loadingState = GeneralLoadingState.done;
        }
      } else {
        cars!.haveNext = result.haveNext;
        cars!.currentPage = result.currentPage;
        cars!.collection.addAll(result.collection);
      }
      settingsService.cars = cars!.collection;
      return true;
    } catch (ex) {
      loadingState = GeneralLoadingState.error;
      return false;
    } finally {
      update();
    }
  }

  void scanCar() async {
    await Get.toNamed(Routes.SCAN_CAR);
    loadCards();
  }
}
