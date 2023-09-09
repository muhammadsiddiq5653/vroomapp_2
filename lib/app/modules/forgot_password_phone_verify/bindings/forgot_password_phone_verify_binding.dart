import 'package:get/get.dart';

import '../controllers/forgot_password_phone_verify_controller.dart';

class ForgotPasswordPhoneVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordPhoneVerifyController>(
      () => ForgotPasswordPhoneVerifyController(),
    );
  }
}
