import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_images_api.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class SignupStepDetailController extends AppAbstractController {
  AuthApi authApi = Get.put(AuthApi());
  AppImagesApi appImagesApi = Get.put(AppImagesApi());
  UserModel user = UserModel(email: '');
  String? userImage;

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
      if (userImage != null) {
        var token = await appImagesApi.upload(userImage!).whenComplete(() {});
        user.media = token;
      }
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
