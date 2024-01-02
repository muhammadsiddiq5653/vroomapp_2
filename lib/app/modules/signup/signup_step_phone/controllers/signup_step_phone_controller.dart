import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class SignupStepPhoneController extends AppAbstractController {
  final appAuthApi = Get.put(AuthApi());
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Rx<User?> user = Rx<User?>(null);

  Future<UserCredential?> signInWithGoogle() async {
    // try {
    //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    //   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    //
    //   final AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleSignInAuthentication.accessToken,
    //     idToken: googleSignInAuthentication.idToken,
    //   );
    //   // Get.toNamed(Routes.MAIN_TABS);
    //
    //   return await _auth.signInWithCredential(credential);
    // } catch (error) {
    //   print("Google sign in error: $error");
    //   return null;
    // }
  }

  Future<UserCredential?> signInWithFacebook() async {
    //   try {
    //     final result = await facebookAuth.login();
    //     final AuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    //     // Get.toNamed(Routes.MAIN_TABS);
    //
    //     return await _auth.signInWithCredential(facebookAuthCredential);
    //   } catch (error) {
    //     print("Facebook sign in error: $error");
    //     return null;
    //   }
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
