import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_notifications_api.dart';
import 'package:vroom_app/app/data/models/notification_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../app_enums.dart';
import '../../../data/models/envelope_model.dart';

class AlertsController extends AppAbstractController {
  AppNotificationsApi appNotificationsApi = Get.put(AppNotificationsApi());
  EnvelopeModel<NotificationModel>? notifications;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadNotifications();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> loadNotifications({int page = 1}) async {
    try {
      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appNotificationsApi.getAll(page: page);
      if (page == 1) {
        notifications = result;
        if ((notifications?.collection.length ?? 0) == 0) {
          loadingState = GeneralLoadingState.empty;
        } else {
          loadingState = GeneralLoadingState.done;
        }
      } else {
        notifications!.haveNext = result.haveNext;
        notifications!.currentPage = result.currentPage;
        notifications!.collection.addAll(result.collection);
      }
      return true;
    } catch (ex) {
      print(ex);
      loadingState = GeneralLoadingState.error;
      return false;
    } finally {
      update();
    }
  }
}
