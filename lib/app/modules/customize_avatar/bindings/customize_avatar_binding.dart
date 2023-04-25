import 'package:get/get.dart';

import '../controllers/customize_avatar_controller.dart';

class CustomizeAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomizeAvatarController>(
      () => CustomizeAvatarController(),
    );
  }
}
