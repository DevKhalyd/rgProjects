import 'package:flutter/material.dart';

final _colors = [
  Colors.white.withOpacity(.05),
  Colors.white.withOpacity(.1),
  Colors.white.withOpacity(.15),
  Colors.white.withOpacity(.2),
];

const _defaultHeight = 40.0;
const _defaultWidth = 180.0;

// 2.5 original
const _angle = 2.8;

class ShapeTransparent extends StatelessWidget {
  const ShapeTransparent({
    Key? key,
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    this.angle = _angle,
    this.transparent = false,
  }) : super(key: key);

  final double height, width;

  /// From 2.5 to a number lesser the rectangle is going up
  ///
  /// From 2.8 to a number greater the rectangle is going down
  final double angle;

  final bool transparent;

  @override
  Widget build(BuildContext context) {
    final listTransparent = _colors
        .map((e) => Colors.white.withOpacity(e.opacity - 0.05))
        .toList()
        .reversed
        .toList();
    return Transform(
      // TODO: Check what method can improve this animation
      //alignment: Alignment.topRight,
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()
        ..rotateX(angle)
        ..rotateY(angle),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: transparent ? Alignment.topRight : Alignment.bottomLeft,
              end: transparent ? Alignment.bottomLeft : Alignment.topRight,
              colors: transparent ? listTransparent : _colors.reversed.toList(),
            )),
      ),
    );
  }
}
