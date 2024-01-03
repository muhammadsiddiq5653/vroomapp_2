import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';


class LoginDetailsStepController extends AppAbstractController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  TextEditingController pinController = TextEditingController();
  AuthApi authApi = Get.put(AuthApi());
  String initialCountry = 'EG';

  String password = '';
  String userName = '';
  final carBrand = 'Audi'.obs;
  bool isObscure = true;

  @override
  void onInit() {
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

  @override
  void onClose() {
    super.onClose();
  }

  void login() async {
    try {
      loadingState = GeneralLoadingState.waiting;

      var authModel = await authApi.signInWithPhonePassword(userName, password);
      pinController.clear();
      password = '';
      settingsService.setAuth(authModel);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isloggedin", true);
      loadingState = GeneralLoadingState.done;
      Get.offAllNamed(Routes.MAIN_TABS);
    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }

  Rx<User?> user = Rx<User?>(null);

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      // Get.toNamed(Routes.MAIN_TABS);

      return await _auth.signInWithCredential(credential);
    } catch (error) {
      print("Google sign in error: $error");
      return null;
    }
  }

  Future<bool> verifyUserName() async {
    return false;
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final result = await facebookAuth.login();
      final AuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Get.toNamed(Routes.MAIN_TABS);

      return await _auth.signInWithCredential(facebookAuthCredential);
    } catch (error) {
      print("Facebook sign in error: $error");
      return null;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }
}
