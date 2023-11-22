import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_app/app/data/api/auth_api.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../../app_constants.dart';

class LoginDetailsStepController extends AppAbstractController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  AuthApi authApi = Get.put(AuthApi());
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: AppConstants.localeForPhone);

  String password = '';
  String phone = '';
  bool isObscure = true;


  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> verifyPhoneNumber( ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve verification code on Android
        FirebaseAuth.instance.signInWithCredential(credential);

      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID for later use
        print('Verification Code Sent: $verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieve timeout on iOS
        print('Auto-Retrieval Timeout: $verificationId');
      },
      timeout: Duration(seconds: 60), // Timeout duration
    );
    //Get.toNamed(Routes.MAIN_TABS);

  }
  void login() async {
    try {
      showLoading();
      var authModel = await authApi.signInWithPhonePassword(phone, password);
      settingsService.setAuth(authModel);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isloggedin", true);
      await Get.toNamed(Routes.MAIN_TABS);

    } catch (ex) {
      dialogService.showError(ex);
    } finally {
      hideLoading();
    }
  }


  Rx<User?> user = Rx<User?>(null);


  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

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

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final result = await facebookAuth.login();
      final AuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
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
