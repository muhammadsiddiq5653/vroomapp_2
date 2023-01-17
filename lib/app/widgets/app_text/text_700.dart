import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/effects/fade_effect.dart';
import '../../app_colors.dart';

class Text700 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final bool animate;
  const Text700(
      {Key? key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.fontSize = 18,
      this.color = Colors.white,
      this.animate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widget = Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700),
    );
    if (!animate) {
      return widget;
    }
    return Animate(effects: [FadeEffect(), ScaleEffect()], child: widget);
  }
}
