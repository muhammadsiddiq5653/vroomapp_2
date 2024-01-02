import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/app_enums.dart';
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
  final carBrand = 'Audi'.obs;

  @override
  void onInit() {
    super.onInit();
    user.username = box.read('phone');
    user.password = box.read('pin');
  }

  updateCarBrand(String name) {
    carBrand(name);
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
      loadingState = GeneralLoadingState.waiting;

      if (userImage != null) {
        var token = await appImagesApi.upload(userImage!).whenComplete(() {});
        user.media = token;
      }
      user.favoriteCarBrand = carBrand.value;
      box.remove('phone');
      box.remove('pin');
      var auth = await authApi.signUp(user);
      print("User Details ->${auth.toString()}" );
      if (auth.accessToken.isNotEmpty) {
        settingsService.setAuth(auth);
        SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setBool("isloggedin", true);
        Get.offAllNamed(Routes.MAIN_TABS);
      } else {
        dialogService.showError(
          "Unable to Register. Please try again later",
        );
      }
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }
}
