import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';

import '../../../routes/app_pages.dart';
import '../../app_abstract_controller.dart';

class ForgotPasswordPhoneController extends AppAbstractController {
  final appAuthApi = Get.put(AuthApi());
  String phone = '';
  PhoneNumber number = PhoneNumber(isoCode: AppConstants.localeForPhone);

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

  void finish() async {
    try {
      EasyLoading.show();
      await appAuthApi.phoneExist(phone);
      Get.toNamed(Routes.FORGOT_PASSWORD_PHONE_VERIFY,
          arguments: {'phone': phone});
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
