import 'package:flutter/material.dart';
import '../../app_colors.dart';

class NormalText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  bool isBold = false;
  final double fontSize;
  NormalText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.color = AppColors.textDarkColor,
      this.fontSize = 20,
      this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : null),
    );
  }
}
