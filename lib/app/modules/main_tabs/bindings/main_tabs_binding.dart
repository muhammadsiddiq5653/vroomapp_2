import 'package:get/get.dart';

import '../controllers/main_tabs_controller.dart';

class MainTabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabsController>(
      () => MainTabsController(),
    );
  }
}
