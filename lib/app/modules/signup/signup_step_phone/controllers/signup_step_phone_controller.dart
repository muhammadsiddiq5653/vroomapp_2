import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';

class SignupStepPhoneController extends AppAbstractController {
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
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
