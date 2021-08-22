import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/mini_widgets.dart';

const _zero = .0;

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: CustomPaint(
          painter: _ChatPainter(),
          child: _TextChild(message),
        ),
      ),
    );
  }
}

class _TextChild extends StatelessWidget {
  const _TextChild(
    this.message, {
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message.length < 25)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextCustom(message),
            Space(
              0.015,
              isHorizontal: true,
            ),
            Transform.translate(
              offset: Offset(0, 5),
              child: _TimeMesssage(),
            )
          ],
        ),
      );

    // When the text is greater than 25 characters
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextCustom(message),
          Space(0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _TimeMesssage(),
            ],
          )
        ],
      ),
    );
  }
}

class _TimeMesssage extends StatelessWidget {
  const _TimeMesssage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final time = '${date.hour}:${date.minute}';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
          time,
          fontSize: 11.0,
          color: Colors.teal.shade900,
        ),
        Space(
          0.02,
          isHorizontal: true,
        ),
        Icon(
          Icons.check,
          color: Colors.teal.shade900,
          size: 11.0,
        )
      ],
    );
  }
}

// NOTE: When the container is too large this one being to deformate
// So use the normal container and add only the shape of the message
class _ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the type of line
    final paint = Paint()
      ..color = ColorsApp.whatsappChatBubble
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
      ..lineTo(size.width + 10, size.height * .01)
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
