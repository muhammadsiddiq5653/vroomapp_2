import 'package:get/get.dart';
import 'package:vroom_app/app/data/models/notification_model.dart';

import '../../app_api_url.dart';
import '../../services/network_service.dart';
import '../models/envelope_model.dart';

class AppNotificationsApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<EnvelopeModel<NotificationModel>> getAll({page = 1}) async {
    var query = {'page': page};
    var result =
        await networkService.get(AppApiUrl.notifications, query: query);
    return EnvelopeModel<NotificationModel>.fromJson(result.data, (data) {
      var feeds = <NotificationModel>[];
      data.forEach((value) {
        feeds.add(NotificationModel.fromJson(value));
      });
      return feeds;
    });
  }
}
