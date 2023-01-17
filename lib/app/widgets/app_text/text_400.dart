import 'package:flutter/material.dart';
import '../../app_colors.dart';

class Text400 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  const Text400(
      {Key? key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.fontSize = 10,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400),
    );
  }
}
