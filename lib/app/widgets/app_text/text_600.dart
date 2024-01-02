import 'package:flutter/material.dart';

class Text600 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final FontStyle fontStyle;
  final TextDecoration? decoration;
  const Text600(
      {Key? key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.fontSize = 10,
        this.fontStyle = FontStyle.italic,
      this.color = Colors.white, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: FontWeight.w600),
    );
  }
}
