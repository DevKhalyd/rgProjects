import 'package:flutter/material.dart';
import '../../../core/extensions/build_context_ext.dart';

const _zero = .0;

class BodyPainter extends StatelessWidget {
  const BodyPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ChatPainter(),
      child: Container(
        width: context.width * .9,
        height: 60,
      ),
    );
  }
}

class _ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the type of line
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(_zero, size.height * .2)
      // Creates a line
      ..lineTo(_zero, size.height * .8)
      // Creates a curve
      ..quadraticBezierTo(
        _zero,
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
      ..lineTo(size.width * 0.04, _zero)
      ..quadraticBezierTo(
        size.width * 0.01,
        _zero,
        _zero,
        size.height * 0.2,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
