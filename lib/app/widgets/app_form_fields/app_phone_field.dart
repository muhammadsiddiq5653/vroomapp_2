import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vroom_app/app/app_colors.dart';

class AppPhoneField extends StatefulWidget {
  const AppPhoneField({Key? key, required this.number, required this.onChanged})
      : super(key: key);

  final PhoneNumber number;
  final Function(PhoneNumber) onChanged;
  @override
  State<StatefulWidget> createState() {
    return _AppPhoneFieldState();
  }
}

class _AppPhoneFieldState extends State<AppPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InternationalPhoneNumberInput(
        locale: 'EG',
        initialValue: widget.number,
        onInputChanged: (PhoneNumber number) {
          widget.onChanged(number);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            trailingSpace: false),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.white),
        formatInput: false,
        textStyle: TextStyle(color: Colors.white),
        spaceBetweenSelectorAndTextField: 0,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.primary,
        inputDecoration: InputDecoration(
            hintText: 'Enter your phone number',
            filled: false,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10.0)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10.0)),
            hintStyle: TextStyle(color: Colors.white),
            hoverColor: AppColors.primary),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }
}
