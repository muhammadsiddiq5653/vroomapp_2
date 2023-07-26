import 'package:get/get.dart';
import 'package:vroom_app/app/services/network_service.dart';

import '../../app_api_url.dart';

class AppImagesApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<String> upload(String imagePath) async {
    var result = await networkService.uploadFile(AppApiUrl.imageUpload,
        image: imagePath);
    return result.data['token'];
  }
}
