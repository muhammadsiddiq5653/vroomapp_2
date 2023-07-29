import 'package:get/get.dart';
import 'package:vroom_app/app/data/models/car_model.dart';

import '../../app_api_url.dart';
import '../../services/network_service.dart';
import '../models/envelope_model.dart';

class AppCarsApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<EnvelopeModel<CarModel>> getCars(
      {required int page, String? sort, String? searchQuery}) async {
    var query = <String, dynamic>{
      'page': page,
    };
    if (sort != null) {
      query['sort'] = sort;
    }
    if (searchQuery != null && searchQuery.trim() != '') {
      query['search_query'] = searchQuery;
    }
    var result = await networkService.get(AppApiUrl.cars, query: query);
    return EnvelopeModel<CarModel>.fromJson(result.data, (data) {
      var cars = <CarModel>[];
      data.forEach((value) {
        cars.add(CarModel.fromJson(value));
      });
      return cars;
    });
  }

  Future<CarModel> getCar(cardId) async {
    var result = await networkService.get(AppApiUrl.cars + "/$cardId");
    return CarModel.fromJson(result.data);
  }

  Future<CarModel> vroomCar(imagePath) async {
    var result =
        await networkService.uploadFile(AppApiUrl.cars, image: imagePath);
    return CarModel.fromJson(result.data);
  }
}
