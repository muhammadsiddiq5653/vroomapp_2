import 'package:get/get.dart';

import '../controllers/signup_step_verify_controller.dart';

class SignupStepVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupStepVerifyController>(
      () => SignupStepVerifyController(),
    );
  }
}
