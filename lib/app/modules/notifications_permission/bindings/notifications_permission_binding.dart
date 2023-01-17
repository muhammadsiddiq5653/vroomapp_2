import 'package:get/get.dart';

import '../controllers/notifications_permission_controller.dart';

class NotificationsPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsPermissionController>(
      () => NotificationsPermissionController(),
    );
  }
}
