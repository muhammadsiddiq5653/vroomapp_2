import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../../app_constants.dart';

class LoginDetailsStepController extends AppAbstractController {
  AuthApi authApi = Get.put(AuthApi());
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: AppConstants.localeForPhone);

  String password = '';
  String phone = '';

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

  void login() async {
    try {
      showLoading();
      var authModel = await authApi.signInWithPhonePassword(phone, password);
      settingsService.setAuth(authModel);
      Get.toNamed(Routes.MAIN_TABS);
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      hideLoading();
    }
  }
}
