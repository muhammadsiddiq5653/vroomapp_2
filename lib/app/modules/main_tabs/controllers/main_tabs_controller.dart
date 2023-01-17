import 'package:get/get.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

class MainTabsController extends AppAbstractController {
  var pageIndex = 0;
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

  void onTap(int value) {
    pageIndex = value;
    update();
    soundService.playclick();
  }
}
