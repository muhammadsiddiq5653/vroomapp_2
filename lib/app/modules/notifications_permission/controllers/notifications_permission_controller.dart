import 'package:get/get.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../app_exception.dart';

class NotificationsPermissionController extends AppAbstractController {
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

  void checkNotification() async {
    try {
      await fcmService.requestPermission();
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    } finally {
      Get.offAndToNamed(Routes.SIGNUP_STEP_DETAIL);
    }
  }

  void skip() {
    Get.offAndToNamed(Routes.SIGNUP_STEP_DETAIL);
  }
}
