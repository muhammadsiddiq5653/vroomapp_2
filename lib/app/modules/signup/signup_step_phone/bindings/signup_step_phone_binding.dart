import 'package:get/get.dart';

import '../controllers/signup_step_phone_controller.dart';

class SignupStepPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupStepPhoneController>(
      () => SignupStepPhoneController(),
    );
  }
}
