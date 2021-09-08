import 'package:flutter/material.dart';

class SlideIcon extends StatelessWidget {
  const SlideIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 25,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
