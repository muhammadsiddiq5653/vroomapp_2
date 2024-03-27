import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';


class LoginDetailsStepController extends AppAbstractController {

  AuthApi authApi = Get.put(AuthApi());
  String initialCountry = 'EG';
  var isLoading = false.obs;
  String password = '';
  String userName = '';
  final carBrand = 'Audi'.obs;
  bool isObscure = true;

  @override
  void onInit() {
    loadingState = GeneralLoadingState.done;
    super.onInit();
 // user.bindStream(_auth.authStateChanges());
  }

  updateCarBrand(String name) {
    carBrand(name);
  }

  @override
  void onReady() {
    super.onReady();
  }


  void login() async {
    try {
      isLoading.value = true;
      var authModel = await authApi.signInWithPhonePassword(userName, password);
      password = '';
      settingsService.setAuth(authModel);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isloggedin", true);
      isLoading.value = false;
      loadingState = GeneralLoadingState.done;
      Get.offAllNamed(Routes.HOME);
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      isLoading.value = false;
      loadingState = GeneralLoadingState.done;
    }
  }

  Future<bool> verifyUserName() async {
    return false;
  }




  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }
}
