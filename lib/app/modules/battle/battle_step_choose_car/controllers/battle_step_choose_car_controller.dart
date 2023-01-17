import 'package:get/get.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/data/models/top_category_car_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../../app_utilities.dart';

class BattleStepChooseCarController extends AppAbstractController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<TopCategoryCarModel> getList() {
    var topCategoryCars = <TopCategoryCarModel>[];
    if (settingsService.cars.length < 1) return topCategoryCars;

    var car = settingsService.cars.reduce(
        (curr, next) => curr.enginePower! > next.enginePower! ? curr : next);
    topCategoryCars.add(TopCategoryCarModel(
        car: car,
        categoryHeadLine: 'Best in Power',
        unit: 'HP',
        value: car.enginePower!.toDouble(),
        percentage: AppUtilities.getWeightPercentage(car.enginePower)));

    car = settingsService.cars
        .reduce((curr, next) => curr.weight! > next.weight! ? curr : next);
    topCategoryCars.add(TopCategoryCarModel(
        car: car,
        categoryHeadLine: 'Best in Weight',
        unit: 'KG',
        value: car.weight!.toDouble(),
        percentage: AppUtilities.getWeightPercentage(car.weight)));

    car = settingsService.cars.reduce(
        (curr, next) => curr.cityMilage! > next.cityMilage! ? curr : next);
    topCategoryCars.add(TopCategoryCarModel(
        car: car,
        categoryHeadLine: 'Best in City Milage',
        unit: 'KM/L',
        value: car.cityMilage!.toDouble(),
        percentage: AppUtilities.getCityMilagePercentage(car.cityMilage)));

    return topCategoryCars;
  }

  void chooseCar(CarModel car) {
    Get.offAndToNamed(Routes.BATTLE_STEP_MATCHING_OPPONENT,
        arguments: {'car': car});
  }
}
