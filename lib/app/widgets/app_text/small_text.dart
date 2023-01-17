import 'package:flutter/material.dart';
import '../../app_colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  const SmallText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.color = AppColors.textDarkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontSize: 14, color: color),
    );
  }
}
