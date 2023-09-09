import 'package:get/get.dart';

import '../controllers/forgot_password_phone_controller.dart';

class ForgotPasswordPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordPhoneController>(
      () => ForgotPasswordPhoneController(),
    );
  }
}
