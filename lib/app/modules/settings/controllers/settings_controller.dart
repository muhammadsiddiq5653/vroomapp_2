import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_users_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

class SettingsController extends AppAbstractController {
  final appsersApi = Get.put(AppUsersApi());
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

  void deleteAccount() async {
    try {
      var result = dialogService
          .showConfirm('Are you sure you want to delete your account?');
      if (result == true) {
        showLoading();
        await appsersApi
            .deleteAccount(settingsService.authModel!.userModel.id!);
        logout();
      }
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      hideLoading();
    }
  }
}
