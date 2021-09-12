import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/utils/custom_painter_animation.dart';
import '../../core/utils/durations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Painter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Painter Bar'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Durations.getDurationInMilliseconds(1250));

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final side = 100.0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
            painter: _CustomBorderAnimated(animation: controller),
            child: Container(
              height: side,
              width: side,
            )));
  }
}

class _CustomBorderAnimated extends CustomPainter {
  final Animation<double> animation;

  _CustomBorderAnimated({required this.animation}) : super(repaint: animation);

  Path _path(Size size) {
    final halfWidth = size.width / 2;
    final halfHeight = size.height / 2;
    return Path()
      ..moveTo(halfWidth, 0)
      ..lineTo(size.width, halfHeight)
      ..lineTo(halfWidth, size.height)
      ..lineTo(0, halfHeight)
      ..close();
  }

  Path _rounded(Size size) {
    final width = size.width;
    final height = size.height;
    final halfWidth = width / 2;
    final halfHeight = height / 2;

    return Path()
      ..moveTo(width * .45, height * .05)
      // Curve top
      ..conicTo(
        //Curve
        halfWidth,
        0,
        width * .75,
        //End
        height * .25,
        2,
      )
      // Right side
      ..conicTo(size.width, halfHeight, width * .75, height * .75, 2)

      // Curve bottom
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      // Left side
      ..conicTo(0, halfHeight, height * .25, width * .25, 2)
      ..close();
    /*
          return Path()
      ..moveTo(height * .25, width * .25)
      // Curve top
      ..conicTo(halfWidth, 0, width * .75, height * .25, 2)
      // Right side
      ..conicTo(size.width, halfHeight, width * .75, height * .75, 2)
      // Curve bottom
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      // Left side
      ..conicTo(0, halfHeight, height * .25, width * .25, 2);
       */

    /* return Path()
      ..moveTo(halfWidth - 15, 0)
      ..conicTo(halfWidth - 7, 0, width * .55, height * .1, 2)
      ..conicTo(width, halfHeight, width * .75, height * .75, 2)
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      ..conicTo(0, halfHeight, halfWidth - 15, 0, 2);*/

    /* return Path()
      ..moveTo(halfWidth, 0)
      // Right side
      ..conicTo(width, halfHeight, width * .75, height * .75, 2)
      // Curve bottom
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      // Left side
      ..conicTo(0, halfHeight, width * .35, height * .15, 2);
      
    // Curve top
    //..conicTo(halfWidth, 0, width * .51, 5, 2);

    // Curve top
    // ..conicTo(halfWidth, 0, width * .75, height * .25, 2)
    // ..close()*/

    /* return Path()
      ..moveTo(halfWidth, 0)
      ..quadraticBezierTo(
          size.width * .75, size.height * .01, size.width, halfHeight)
      ..quadraticBezierTo(
          size.width * .75, size.height * 1, halfWidth, size.height)
      ..quadraticBezierTo(size.width * .15, size.height * .9, 0, halfHeight)
      ..quadraticBezierTo(size.width * .15, size.height * .1, halfWidth, 0);*/
  }

  @override
  void paint(Canvas canvas, Size size) {
    final value = animation.value;

    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = animatePath(_rounded(size), value);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => true;
}

// ignore: unused_element
class _SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = 100;
    final sides = 4;

    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ignore: unused_element
class _BodyCircle extends StatelessWidget {
  const _BodyCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircleShape(),
      child: Container(),
    );
  }
}

class _CircleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 100,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
