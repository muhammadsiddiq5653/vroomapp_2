import 'package:get/get.dart';

import '../controllers/signup_step_detail_controller.dart';

class SignupStepDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupStepDetailController>(
      () => SignupStepDetailController(),
    );
  }
}
