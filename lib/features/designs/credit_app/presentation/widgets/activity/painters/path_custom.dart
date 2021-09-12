import 'package:flutter/material.dart';



class PathCustom extends CustomClipper<Path> {
  @override
  getClip(Size size) {
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
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
