import 'package:flutter/material.dart';

import '../../app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? defaultValue;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final String? Function(String?)? Validator;
  final Function()? onTap;
  final Function(String)? onSubmitted;

  const AppTextField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      this.maxLines = 1,
      this.maxLength,
      this.prefixIcon,
      this.suffixIcon,
      this.defaultValue,
      this.obscureText = false,
      this.textEditingController,
      this.onTap,
      this.Validator,
      this.onSubmitted,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      initialValue: defaultValue,
      controller: textEditingController,
      maxLength: maxLength,
      obscureText: obscureText,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        hintStyle: TextStyle(
          color: AppColors.onBackground.withOpacity(0.5),
          fontStyle: FontStyle.italic,
        ),
        labelStyle: TextStyle(
          color: AppColors.onBackground.withOpacity(0.5),
          fontStyle: FontStyle.italic,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(10.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
