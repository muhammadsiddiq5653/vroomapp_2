import 'package:get/get.dart';
import 'package:vroom_app/app/app_enums.dart';

import '../../../app_constants.dart';
import '../../../data/api/app_users_api.dart';
import '../../../data/api/auth_api.dart';
import '../../../routes/app_pages.dart';
import '../../app_abstract_controller.dart';

class ChangePasswordController extends AppAbstractController {
  AppUsersApi appUsersApi = Get.put(AppUsersApi());
  final appAuthApi = Get.put(AuthApi());
  String oldPassword = "";
  String newPassword = "";
  String confirmPassword = "";
  String? firebaseIdToken;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      firebaseIdToken = Get.arguments?[AppConstants.firebaseTokenID];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void finish() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      if (newPassword != confirmPassword) {
        throw Exception('Passowrd and Confirm Password at are not matched'.tr);
      }
      if (firebaseIdToken == null) {
        await appUsersApi.changePassword(
            settingsService.authModel?.userModel.id ?? 0,
            oldPassword,
            newPassword);
        Get.back();
      } else {
        await appAuthApi.resetPasswordByFirebaseToken(
            newPassword, firebaseIdToken!);
        Get.offAllNamed(Routes.SPLASH);
        dialogService.showInfo('Password reseted successfully');
      }
    } catch (ex, stack) {
      print(ex);
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
