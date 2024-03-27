import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';

import '../../../app_enums.dart';
import '../../../routes/app_pages.dart';
import '../../app_abstract_controller.dart';

class ForgotPasswordPhoneController extends AppAbstractController {
  final appAuthApi = Get.put(AuthApi());
  String phone = '';
  String number = '';

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
      loadingState = GeneralLoadingState.waiting;
      await appAuthApi.userNameExist(phone);
      Get.toNamed(Routes.FORGOT_PASSWORD_PHONE_VERIFY,
          arguments: {'phone': phone});
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
