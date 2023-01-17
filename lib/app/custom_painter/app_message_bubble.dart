//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class AppMessageBubble extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffC90000).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, 0, size.width, size.height * 0.8421053),
            bottomRight: Radius.circular(size.width * 0.1315789),
            bottomLeft: Radius.circular(size.width * 0.1315789),
            topLeft: Radius.circular(size.width * 0.1315789),
            topRight: Radius.circular(size.width * 0.1315789)),
        paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5075965, size.height * 0.9605263);
    path_1.cubicTo(
        size.width * 0.5042202,
        size.height * 0.9780711,
        size.width * 0.4957798,
        size.height * 0.9780711,
        size.width * 0.4924035,
        size.height * 0.9605263);
    path_1.lineTo(size.width * 0.4696132, size.height * 0.8421053);
    path_1.cubicTo(
        size.width * 0.4662368,
        size.height * 0.8245605,
        size.width * 0.4704570,
        size.height * 0.8026316,
        size.width * 0.4772096,
        size.height * 0.8026316);
    path_1.lineTo(size.width * 0.5227904, size.height * 0.8026316);
    path_1.cubicTo(
        size.width * 0.5295430,
        size.height * 0.8026316,
        size.width * 0.5337632,
        size.height * 0.8245605,
        size.width * 0.5303868,
        size.height * 0.8421053);
    path_1.lineTo(size.width * 0.5075965, size.height * 0.9605263);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffC90000).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
