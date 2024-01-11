import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Text400 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final double? height;
  final double? fontSize;
  final  TextDecoration? decoration;
   Text400(
      {Key? key,
      required this.text,
      this.textAlign,
      this.maxLines,

      this.fontSize = 10,
      this.color = Colors.white, this.decoration, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          decoration: decoration,
          overflow: TextOverflow.visible,
          height: height,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400),
    );
  }
}
