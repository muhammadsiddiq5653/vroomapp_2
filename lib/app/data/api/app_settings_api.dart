import 'package:get/get.dart';

import '../../app_api_url.dart';
import '../../services/network_service.dart';
import '../models/app_settings_model.dart';

class AppSettingsApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<AppSettingsModel> getAppSettings() async {
    var result = await networkService.get(AppApiUrl.appSettings);
    return AppSettingsModel.fromJson(result.data);
  }
}
