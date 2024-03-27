import 'package:vroom_app/app/data/models/car_model.dart';

class TopCategoryCarModel {
  late CarModel car;
  late String categoryHeadLine;
  late String unit;
  late double value;
  late double percentage;

  TopCategoryCarModel(
      {required this.car,
      required this.categoryHeadLine,
      required this.unit,
      required this.value,
      required this.percentage});
}
