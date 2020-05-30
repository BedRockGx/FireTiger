import 'package:flutter/material.dart';

// 弯弯线条 组件页面

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Color(0xffFF3641);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;

    var startPoint = Offset(0, size.height);
    var controlPoint1 = Offset(size.width / 10 - 10, size.height + 5);
    var controlPoint2 = Offset(size.width / 7 - 3, size.height + 5);
    var endPoint = Offset(size.width / 5, size.height);
    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);

    //绘制圆弧
    // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
    // Rect rect2 = Rect.fromCircle(center: Offset(2.0, 40.0), radius: 10.0);
    // canvas.drawArc(rect2, 0.0, 3.0, false, paint);

    // Path path = new Path()..moveTo(0.0, 100.0);
    //   Rect rect = Rect.fromCircle(center: Offset(20.0, 30.0), radius: 20.0);
    //   path.arcTo(rect, 0.0, 3.14, true);
    //   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
