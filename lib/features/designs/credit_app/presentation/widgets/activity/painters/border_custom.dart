import 'package:flutter/material.dart';

import '../../../../../../../core/utils/custom_painter_animation.dart';

class CustomBorderAnimated extends CustomPainter {
  final double value;
  final Color borderColor;

  const CustomBorderAnimated({required this.value, required this.borderColor});

  Path roundedLine(Size size) {
    final width = size.width;
    final height = size.height;
    final halfWidth = width / 2;
    final halfHeight = height / 2;

    return Path()
      ..moveTo(width * .45, height * .05)
      // Curve top
      ..conicTo(halfWidth, 0, width * .75, height * .25, 2)
      // Right _side
      ..conicTo(size.width, halfHeight, width * .75, height * .75, 2)
      // Curve bottom
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      // Left _side
      ..conicTo(0, halfHeight, height * .25, width * .25, 2)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paintAnimation = Paint()
      ..color = borderColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintDefault = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final pathAnimation = animatePath(roundedLine(size), value);
    final defaultPath = roundedLine(size);

    canvas.drawPath(defaultPath, paintDefault);
    canvas.drawPath(pathAnimation, paintAnimation);
  }

  @override
  bool shouldRepaint(_) => true;
}
