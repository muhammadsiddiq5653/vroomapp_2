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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        text,
        textDirection: TextDirection.ltr,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            overflow: textOverflow),
      ),
    );
  }
}
