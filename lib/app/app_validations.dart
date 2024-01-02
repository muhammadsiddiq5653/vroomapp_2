// Flutter imports:

class AppValidations {
  static RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$'); // Allows only alphabetic characters and spaces
  static RegExp phoneNumberRegExp = RegExp(r'^\d{10}$'); // Regular expression for a simple 10-digit US phone number format


  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Please enter valid name';
    }
    return null;
  }


  static String? validatePhoneNumber(String? value) {

    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    else if (!phoneNumberRegExp.hasMatch(value)) {
      return 'Please enter valid number';
    }
    return null;
  }
}
