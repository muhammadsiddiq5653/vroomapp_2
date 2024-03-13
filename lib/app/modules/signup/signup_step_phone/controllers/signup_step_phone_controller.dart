import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class SignupStepPhoneController extends AppAbstractController {
  final appAuthApi = Get.put(AuthApi());

  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FacebookAuth facebookAuth = FacebookAuth.instance;
  String number = '';
  String username = '';
  String password = '';

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



  Future<void> next() async {
    try {
      final bool = await appAuthApi.userNameExist(username);

      if (bool) {
        dialogService.showError('UserName Already Exist');
      } else {
        Get.toNamed(Routes.SIGNUP_STEP_VERIFY,
            arguments: {'username': username, 'password': password});
      }
    } catch (ex) {
      dialogService.showError(ex);
    }
  }

  void validate() {
    if (username == '' || username.length < 6) {
      throw Exception("Enter a valid username");
    }
  }
}
