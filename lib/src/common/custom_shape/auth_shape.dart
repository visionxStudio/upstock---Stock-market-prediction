import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class AuthCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.8194912);
    path_0.cubicTo(
        size.width * 0.004289206,
        size.height * 0.8083592,
        size.width * 0.01338089,
        size.height * 0.7984560,
        size.width * 0.02612313,
        size.height * 0.7914806);
    path_0.lineTo(size.width * 0.4574182, size.height * 0.5554278);
    path_0.cubicTo(
        size.width * 0.4819813,
        size.height * 0.5419842,
        size.width * 0.5152407,
        size.height * 0.5419842,
        size.width * 0.5398037,
        size.height * 0.5554278);
    path_0.lineTo(size.width * 0.9710981, size.height * 0.7914806);
    path_0.cubicTo(size.width * 0.9892547, size.height * 0.8014190, size.width,
        size.height * 0.8173063, size.width, size.height * 0.8342148);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffBFDBFE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
