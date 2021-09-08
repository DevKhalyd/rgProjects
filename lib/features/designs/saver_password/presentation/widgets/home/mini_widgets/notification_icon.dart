import 'package:flutter/material.dart';

const _side = 6.0;

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -7,
          right: 6,
          child: Container(
            height: _side,
            width: _side,
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Icon(
          Icons.notifications_none_sharp,
          color: Colors.grey.shade300,
          size: 30.0,
        )
      ],
    );
  }
}
