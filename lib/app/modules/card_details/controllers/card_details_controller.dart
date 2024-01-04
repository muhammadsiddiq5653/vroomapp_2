import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/data/api/app_feed_api.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/modules/feed/controllers/feed_controller.dart';
import 'package:vroom_app/app/services/sound_service.dart';

import '../../../data/models/feed_model.dart';

class CardDetailsController extends AppAbstractController {
  final soundService = Get.put(SoundService());
  final appCarsApi = Get.put(AppCarsApi());
  final appFeedApi = Get.put(AppFeedApi());
  final feedController = Get.put(FeedController());
  CarModel? car;
  int? carId;
  RxBool isLoggedin = false.obs;

  @override
  void onInit() {
    super.onInit();
    readFromPreferences();
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

  readFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedin.value = prefs.getBool("isloggedin") ?? false;
    update();
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

  void shareCar() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      await appFeedApi.add(FeedModel(
          carModel: car,
          cover: '',
          createdAt: DateTime.now(),
          description: ''));
      loadingState = GeneralLoadingState.done;
      dialogService.showInfo('Car added to the feed');
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }

  bool checkIfLoggedInUserPost() => loadingState == GeneralLoadingState.done
      ? car!.user!.id == settingsService.authModel!.userModel.id
      : false;

  void shareOutsideApp(Uint8List? bytes) async {
    FeedModel feed = FeedModel(
        carModel: car, cover: '', createdAt: DateTime.now(), description: '');
    try {
      loadingState = GeneralLoadingState.waiting;
      AppUtilities.share(bytes);
      loadingState = GeneralLoadingState.done;
      update();
    } catch (ex) {
      print(ex);
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }

  void deleteCar() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      await appCarsApi.deleteUserCar(car!.userCardId);
      // dialogService.showInfo('Car deleted');
      Get.back(result: true);
    } catch (ex) {
      dialogService.showError('Cant delete the car, already deleted?');
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
