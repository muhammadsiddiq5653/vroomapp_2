import 'package:flutter/material.dart';
import '../../app_colors.dart';

class ExtraSmallText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  const ExtraSmallText(
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
      style: TextStyle(fontSize: 10, color: color),
    );
  }
}
