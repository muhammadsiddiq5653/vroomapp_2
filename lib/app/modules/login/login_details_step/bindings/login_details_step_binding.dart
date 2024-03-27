import 'package:get/get.dart';

import '../controllers/login_details_step_controller.dart';

class LoginDetailsStepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginDetailsStepController>(
      () => LoginDetailsStepController(),
    );
  }
}
