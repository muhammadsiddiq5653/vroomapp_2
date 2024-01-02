import 'package:get/get.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/app_users_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../data/api/app_images_api.dart';
import '../../../data/models/user_model.dart';

class EditProfileController extends AppAbstractController {
  AppUsersApi appUsersApi = Get.put(AppUsersApi());
  AppImagesApi appImagesApi = Get.put(AppImagesApi());
  String name = '';
  String email = '';
  String? userImage;

  @override
  void onInit() {
    super.onInit();
    name = settingsService.authModel!.userModel.name ?? '';
    email = settingsService.authModel!.userModel.email ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void save() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      var user = UserModel(
          email: email,
          name: name,
          id: settingsService.authModel?.userModel.id);

      if (userImage != null) {
        var token = await appImagesApi.upload(userImage!).whenComplete(() {});
        user.media = token;
      }
      var newUser = await appUsersApi.edit(user);
      settingsService.authModel?.userModel = newUser;
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
      Get.back();
    }
  }
}
