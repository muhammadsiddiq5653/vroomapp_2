import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class SignupStepDetailController extends AppAbstractController {
  AuthApi authApi = Get.put(AuthApi());
  UserModel user = UserModel(email: '');
  @override
  void onInit() {
    super.onInit();
    user.phone = Get.arguments?['phone'];
    user.phoneCode = Get.arguments?['phoneCode'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void regsiter() async {
    try {
      showLoading();
      var auth = await authApi.signUp(user);
      settingsService.setAuth(auth);
      Get.toNamed(Routes.MAIN_TABS);
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      hideLoading();
    }
  }
}
