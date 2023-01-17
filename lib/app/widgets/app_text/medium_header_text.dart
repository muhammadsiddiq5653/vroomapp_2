import 'package:flutter/material.dart';
import '../../app_colors.dart';

class MediumHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  const MediumHeaderText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.color = AppColors.textDarkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: color),
    );
  }
}
