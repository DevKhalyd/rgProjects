import 'package:flutter/material.dart';

import '../widgets/body_painter.dart';

// Resources https://blog.codemagic.io/flutter-custom-painter/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Painter',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('App Bar'),
        ),
        body: Center(child: BodyPainter()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: _ShapePainterWithPathMessage(),
        child: Container(),
      ),
    );
  }
}

// Source https://stackoverflow.com/questions/60383699/how-to-draw-shapes-using-bezier-curves-in-a-flutter-custompainter
// AN ADDITIONAL RESOURCE https://erdoganbavas.medium.com/custom-paint-in-flutter-with-some-curves-fcf5fd0bec4a
/// A little more complex
// ignore: unused_element
class _ShapePainterWithPathCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the type of line
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * .6, 0)
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .08,
        size.width * .9,
        size.height * .05,
      )
      ..arcToPoint(
        Offset(
          size.width * .93,
          size.height * .15,
        ),
        radius: Radius.circular(size.height * .05),
        largeArc: true,
      )
      ..cubicTo(
        size.width * .6,
        size.height * .15,
        size.width * .5,
        size.height * .46,
        0,
        size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// A little more complex
// ignore: unused_element
class _ShapePainterWithPathMessage extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the type of line
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // Give a direction to go
    final path = Path()
      ..moveTo(20, (size.height / 2))
      // Stop before
      ..lineTo(20, (size.height / 2) + 30)
      ..quadraticBezierTo(
        // control
        20,
        (size.height / 2) + 40,
        // final path
        30,
        (size.height / 2) + 40,
      )
      ..lineTo(size.width * 0.9, (size.height / 2) + 40)
      ..quadraticBezierTo(size.width * 0.925, (size.height / 2) + 40,
          size.width * 0.925, (size.height / 2) + 20)
      ..lineTo(size.width * 0.925, (size.height / 2))
      ..lineTo(size.width * 0.95, (size.height / 2) - 20)
      ..lineTo(30, (size.height / 2) - 20)
      ..quadraticBezierTo(20, (size.height / 2) - 20, 20, (size.height / 2));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ignore: unused_element
class _ShapePainterWithCustomCorner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.lineTo(size.width, (size.height / 2) + 20);
    canvas.drawCircle(Offset(size.width, (size.height / 2) + 20), 1, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Basic example
// ignore: unused_element
class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the line to draw
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    // Points to start to draw
    final startingPoint = Offset(0, size.height / 2);
    final endingPoint = Offset(size.width, size.height / 2);

    // Draw it
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
