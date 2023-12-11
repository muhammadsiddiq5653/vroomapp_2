import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

import '../../../../app_constants.dart';

class SignupStepPhoneController extends AppAbstractController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FacebookAuth facebookAuth = FacebookAuth.instance;
  PhoneNumber number = PhoneNumber(isoCode: AppConstants.localeForPhone);
  String phone = '';
  String phoneCode = '';

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


  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
  //
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     // Get.toNamed(Routes.MAIN_TABS);
  //
  //     return await _auth.signInWithCredential(credential);
  //   } catch (error) {
  //     print("Google sign in error: $error");
  //     return null;
  //   }
  // }
  //
  // Future<UserCredential?> signInWithFacebook() async {
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
  // }
  void next() {
    try {
      validate();
      Get.toNamed(Routes.SIGNUP_STEP_VERIFY,
          arguments: {'phone': phone, 'phoneCode': phoneCode});
    } catch (ex) {
      dialogService.showError(ex);
    }
  }

  void validate() {
    if (phone == '' || phone.length < 6) {
      throw Exception("invalid phone number");
    }
  }
}
