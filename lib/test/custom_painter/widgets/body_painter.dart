import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_ext.dart';

const zero = .0;

class BodyPainter extends StatelessWidget {
  const BodyPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChatPainter(),
      child: Container(
        color: Colors.red.withOpacity(0.3),
        width: context.width * .9,
        // TODO: Replace with text instead of height
        height: 60,
      ),
    );
  }
}

class ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the type of line
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(zero, size.height * .2)
      ..lineTo(zero, size.height * .8)
      ..quadraticBezierTo(
        zero,
        size.height,
        size.width * 0.04,
        size.height,
      )
      ..lineTo(size.width * 0.95, size.height)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, size.height * .2)
      ..lineTo(size.width + 15, size.height * .01)
      ..lineTo(size.width * 0.04, zero)
      ..quadraticBezierTo(
        size.width * 0.01,
        zero,
        zero,
        size.height * 0.2,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
