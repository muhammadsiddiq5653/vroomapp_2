import 'package:get/get.dart';
import 'package:vroom_app/app/app_enums.dart';
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


  void deleteAccount(bool result) async {
    try {

      if (result == true) {
        loadingState = GeneralLoadingState.waiting;
        await appsersApi
            .deleteAccount(settingsService.authModel!.userModel.id!);
        logout();
      }
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
