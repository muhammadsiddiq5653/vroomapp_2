import 'package:flutter/material.dart';

import '../../app_colors.dart';

class BigHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const BigHeaderText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.fontSize = 18,
      this.fontWeight = FontWeight.bold,
      this.color = AppColors.textDarkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }
}
