import 'package:flutter/material.dart';
import '../../app_colors.dart';

class SmallBoldText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final Color? color;
  const SmallBoldText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.textOverflow,
      this.color = AppColors.textDarkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.bold,
          overflow: textOverflow),
    );
  }
}
