import 'package:flutter/material.dart';

import '../../app_colors.dart';

class BigHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;

  const BigHeaderText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.fontSize = 18,
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
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
