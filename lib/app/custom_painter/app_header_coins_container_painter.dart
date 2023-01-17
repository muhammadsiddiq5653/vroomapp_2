import 'package:flutter/material.dart';

class AppHeaderCoinsContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1041667, size.height * 0.5000000);
    path_0.cubicTo(size.width * 0.1536458, size.height * 0.2625000,
        size.width * 0.2017208, 0, size.width * 0.2578125, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.5000000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffC90000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
